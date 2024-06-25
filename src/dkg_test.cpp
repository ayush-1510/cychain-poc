#include <string>
#include <iostream>
#include <chrono>
#include <vector>
#include <cmath>
#include <map>
#include <random>
#include <openssl/rand.h>
#include <stdlib.h>
#include <stdint.h>

#include <thread>
#include <mutex>
#include <condition_variable>
#include <queue>
#include <functional>
#include <atomic>
#include <future>

#include "ThreadPool.h"
#include "CryptoUtils.h"

#include "bicycl.hpp"

extern "C"
{
#include "ecdsa.h"
#include "bignum.h"
#include "curves.h"
#include "bip32.h"
}

using std::string;

class IntegerDualPolynomial {
private:
    unsigned int t; // number of shares required to reconstruct the secret
    unsigned int n;
    BICYCL::Mpz n_fact;
    std::vector<BICYCL::Mpz> coefficients;

    // can make this function parallel
    BICYCL::Mpz factorial(unsigned int n) {
        BICYCL::Mpz result(1UL);
        BICYCL::Mpz temp;

        for (unsigned long i = 2; i <= n; ++i) {
            temp = BICYCL::Mpz (i);
            BICYCL::Mpz::mul(result, result, temp); 
        }

        return result;
    }

    void generateCoefficients(const BICYCL::Mpz &exponent_bound, BICYCL::RandGen &randgen) {
        coefficients.resize(n-t);
        BICYCL::Mpz coeff_bound(exponent_bound);

        for (unsigned int i = 0; i < n-t; ++i) {
            coefficients[i] = randgen.random_mpz(coeff_bound);
        }
    }
public:
    IntegerDualPolynomial(unsigned int t, unsigned int n, const BICYCL::Mpz &exponent_bound, BICYCL::RandGen &randgen)
        : t(t), n(n) {
        
        n_fact = factorial(n);
        generateCoefficients(exponent_bound, randgen);
    }

    IntegerDualPolynomial(unsigned int t, unsigned int n, const std::vector<BICYCL::Mpz> &coefficients)
        : t(t), n(n), coefficients(coefficients) {
        if (coefficients.size() != n-t) {
            throw std::invalid_argument("The number of coefficients must be n-t");
        }

        n_fact = factorial(n);
    }

    const std::vector<BICYCL::Mpz> &get_coefficients() const {
        return coefficients;
    }

    // Method to evaluate the polynomial at a given x value
    BICYCL::Mpz evaluate(const unsigned long x, const std::vector<unsigned int> &P) const {
        BICYCL::Mpz result = coefficients[n-t-1];
        BICYCL::Mpz temp;

        for (int i = n - t - 2; i >= 0; --i) {
            BICYCL::Mpz::mul(temp, result, x); // temp = result * x
            BICYCL::Mpz::add(result, temp, coefficients[i]); // result = temp + coefficients[i]
        }

        BICYCL::Mpz delta_vi = compute_delta_vi(x, P, n_fact);
        BICYCL::Mpz::mul(result, result, delta_vi);

        return result;
    }

    // Static function compute_delta_vi. Ideally, the delta should be computed in the function as n!
    static BICYCL::Mpz compute_delta_vi(int i, const std::vector<unsigned int> &P, const BICYCL::Mpz &delta) {
        // Check if i is in P
        if (std::find(P.begin(), P.end(), i) == P.end()) {
            throw std::invalid_argument("The integer i is not in the list P");
        }

        // Initialize denominator_inverse as Mpz
        BICYCL::Mpz denominator_inverse = delta;
        BICYCL::Mpz temp;

        // Loop through the list of integers
        for (const auto &j : P) {
            if (j != i) {
                // BICYCL::Mpz::mul(numerator, numerator, j);
                BICYCL::Mpz i_minus_j ((signed long) i - j);
                BICYCL::Mpz::divexact(denominator_inverse, denominator_inverse, i_minus_j);
            }
        }

        return denominator_inverse;
    }

    static bool verification(std::vector<BICYCL::Mpz> shares, std::vector<BICYCL::Mpz> duals) {
        if (shares.size() != duals.size()) {
            throw std::invalid_argument("The number of shares and duals must be the same.");
        }

        BICYCL::Mpz result(0UL);
        BICYCL::Mpz temp;

        for (int i = 0; i < shares.size(); ++i) {
            BICYCL::Mpz::mul(temp, shares[i], duals[i]);
            BICYCL::Mpz::add(result, result, temp);
        }

        if (result == 0UL) {
            std::cout << "Verification successful.\n";
            return true;
        } else {
            std::cout << "Verification failed.\n";
            return false;
        }
    }
};

class IntegerPolynomial {
private:
    unsigned int t; // number of shares required to reconstruct the secret
    unsigned int n;
    BICYCL::Mpz n_fact;
    std::vector<BICYCL::Mpz> coefficients;

    // can make this function parallel
    static BICYCL::Mpz factorial(unsigned int n) {
        BICYCL::Mpz result(1UL);
        BICYCL::Mpz temp;

        for (unsigned long i = 2; i <= n; ++i) {
            temp = BICYCL::Mpz (i);
            BICYCL::Mpz::mul(result, result, temp); 
        }

        return result;
    }

    void generateCoefficients(const BICYCL::Mpz &exponent_bound, const BICYCL::Mpz &secret, BICYCL::RandGen &randgen) {
        coefficients.resize(t);
        BICYCL::Mpz factorial_n = n_fact;

        BICYCL::Mpz::mul(factorial_n, factorial_n, secret);
        coefficients[0] = factorial_n;

        BICYCL::Mpz coeff_bound(exponent_bound);
        BICYCL::Mpz::mul(coeff_bound, coeff_bound, (unsigned long) 2 * t * t);

        BICYCL::Mpz n_to_n((unsigned long) n);
        BICYCL::Mpz::pow_ui(n_to_n, n_to_n, (unsigned long) n);

        BICYCL::Mpz::mul(coeff_bound, coeff_bound, n_to_n);
        BICYCL::Mpz::mulby2k(coeff_bound, coeff_bound, 42);

        for (unsigned int i = 1; i < t; ++i) {
            coefficients[i] = randgen.random_mpz(coeff_bound);
        }
    }
public:
    // Constructor that takes t, n, exponent bound, and secret
    IntegerPolynomial(unsigned int t, unsigned int n, const BICYCL::Mpz &exponent_bound, const BICYCL::Mpz &secret, BICYCL::RandGen &randgen)
        : t(t), n(n) {
        BICYCL::Mpz factorial_n = factorial(n);
        this->n_fact = factorial_n;
        generateCoefficients(exponent_bound, secret, randgen);
    }

    // Constructor that takes only t, n and exponent bound
    IntegerPolynomial(unsigned int t, unsigned int n, const BICYCL::Mpz &exponent_bound, BICYCL::RandGen &randgen)
        : t(t), n(n) {
        BICYCL::Mpz secret = randgen.random_mpz(exponent_bound);
        BICYCL::Mpz factorial_n = factorial(n);
        this->n_fact = factorial_n;
        generateCoefficients(exponent_bound, secret, randgen);
    }
        
    // Constructor that takes t, n, and a vector of coefficients
    IntegerPolynomial(unsigned int t, unsigned int n, const std::vector<BICYCL::Mpz> &coefficients)
        : t(t), n(n), coefficients(coefficients) {
        if (coefficients.size() != t) {
            throw std::invalid_argument("The number of coefficients must be t");
        }
        // multiply n_fact with the secret
        BICYCL::Mpz factorial_n = factorial(n);
        this->n_fact = factorial_n;
        BICYCL::Mpz::mul(this->coefficients[0], this->coefficients[0], factorial_n);
    }

    // TODO - remove this get coefficients
    const std::vector<BICYCL::Mpz> &get_coefficients() const {
        return coefficients;
    }
        
    // Method to evaluate the polynomial at a given x value
    BICYCL::Mpz evaluate(const unsigned long x) const {
        BICYCL::Mpz result = coefficients[t-1];
        BICYCL::Mpz temp;

        for (int i = t - 2; i >= 0; --i) {
            BICYCL::Mpz::mul(temp, result, x); // temp = result * x
            BICYCL::Mpz::add(result, temp, coefficients[i]); // result = temp + coefficients[i]
        }

        return result;
    }

    // Static function compute_delta_lambda. Ideally, the delta should be computed in the function as n!
    static BICYCL::Mpz compute_delta_lambda(int i, const std::vector<unsigned int> &P, const BICYCL::Mpz &delta) {
        // Check if i is in P
        if (std::find(P.begin(), P.end(), i) == P.end()) {
            throw std::invalid_argument("The integer i is not in the list P");
        }

        // Initialize numerator and denominator_inverse as Mpz
        BICYCL::Mpz numerator(1UL);
        BICYCL::Mpz denominator_inverse = delta;
        BICYCL::Mpz temp;

        // Loop through the list of integers
        for (const auto &j : P) {
            if (j != i) {
                BICYCL::Mpz::mul(numerator, numerator, j);
                BICYCL::Mpz j_minus_i ((signed long) j - i);
                BICYCL::Mpz::divexact(denominator_inverse, denominator_inverse, j_minus_i);
            }
        }

        // Multiply both numerator and denominator_inverse
        BICYCL::Mpz::mul(numerator, numerator, denominator_inverse);

        return numerator;
    }

    // static function that reconstructs secret from shares
    static BICYCL::Mpz reconstruct(unsigned int t, unsigned int n, 
                                   std::vector<BICYCL::Mpz> shares, 
                                   std::vector<unsigned int> indices) {
        if (shares.size() < t || shares.size() > n || shares.size() != indices.size()) {
            throw std::invalid_argument("The number of shares must be >= t and <= n.");
        }

        BICYCL::Mpz result(0UL);
        BICYCL::Mpz delta = factorial(n);

        for (int i = 0; i < shares.size(); ++i) {
            BICYCL::Mpz product(1UL);
            BICYCL::Mpz lambda = compute_delta_lambda(indices[i], indices, delta);

            BICYCL::Mpz::mul(product, product, shares[i]);
            BICYCL::Mpz::mul(product, product, lambda);

            BICYCL::Mpz::add(result, result, product);
        }

        BICYCL::Mpz::divexact(result, result, delta);
        BICYCL::Mpz::divexact(result, result, delta);

        return result;
    }
};

// can make this function parallel
BICYCL::Mpz factorial(unsigned int n) {
    BICYCL::Mpz result(1UL);
    BICYCL::Mpz temp;

    for (unsigned long i = 2; i <= n; ++i) {
        temp = BICYCL::Mpz (i);
        BICYCL::Mpz::mul(result, result, temp); 
    }

    return result;
}

// Function to divide the big number into smaller chunks less than q
std::vector<BICYCL::Mpz> to_q_ary(const BICYCL::Mpz &number, const BICYCL::Mpz &q) {
    std::vector<BICYCL::Mpz> result;
    BICYCL::Mpz current = number;
    BICYCL::Mpz chunk;

    int i = 0;

    while (current > 0UL) {
        BICYCL::Mpz::mod(chunk, current, q); // chunk = current % q
        result.push_back(chunk);

        BICYCL::Mpz::sub(current, current, chunk); // current = current - chunk
        BICYCL::Mpz::divexact(current, current, q); // current = current / q
    }

    return result;
}

// Function to reconstruct the big number from chunks
BICYCL::Mpz from_q_ary(const std::vector<BICYCL::Mpz> &chunks, const BICYCL::Mpz &q) {
    BICYCL::Mpz result(0UL);
    BICYCL::Mpz base(1UL);
    BICYCL::Mpz temp;

    for (const auto &chunk : chunks) {
        BICYCL::Mpz::mul(temp, chunk, base); // temp = chunk * base
        BICYCL::Mpz::add(result, result, temp); // result = result + temp
        BICYCL::Mpz::mul(base, base, q); // base = base * q
    }

    return result;
}

int main() {
    size_t k = 1;
    const ecdsa_curve *curve = get_curve_by_name(SECP256K1_NAME)->params;

    // set seed as time
    BICYCL::Mpz seed = BICYCL::Mpz((unsigned long) time(NULL));
    BICYCL::RandGen randgen(seed);

    ThreadPool pool(std::thread::hardware_concurrency());
    std::cout << "Created ThreadPool of size: " << std::thread::hardware_concurrency() << "\n";

    // Setting up the the public parameters where message space is the curve order of SECP256K1
    BICYCL::Mpz q(0UL);
    q = string("115792089237316195423570985008687907852837564279074904382605163141518161494337");

    BICYCL::Mpz p(0UL);

    p = string("43193454325736827482201750544140481404008634846532639450547372755026427405991826700723249528255049592325421795981143653914129884011306525120950744025035685855512695631736186909872842154602977956593529422235466196411674948283663780511726036070197880528511138509668014828860898402959171280613034578545771859496996085810790266951981368946435378708249190772155224039947314675049652489452429836293254671938998647344790956467563810567741334084883797963767053599118688017207673143");

    std::cout << "Setting up class group...\n";
    BICYCL::CL_HSMqk pp = BICYCL::CL_HSMqk(q, k, p);
    std::cout << "Class group successfully setup.\n";

    BICYCL::Mpz fact = factorial(5);
    std::cout << fact << std::endl;

    BICYCL::Mpz number("1");

    // Divide number into chunks
    std::vector<BICYCL::Mpz> chunks = to_q_ary(number, q);
    
    // Print the chunks
    std::cout << "Chunks:" << std::endl;
    for (const auto &chunk : chunks) {
        std::cout << chunk << std::endl;
    }

    // Reconstruct the number from chunks
    BICYCL::Mpz reconstructed_number = from_q_ary(chunks, q);
    
    // Print the reconstructed number
    std::cout << "Reconstructed number: " << reconstructed_number << std::endl;

    unsigned int t = 2000;
    unsigned int n = 3000;

    BICYCL::Mpz secret(1232346886UL);
    IntegerPolynomial ip = IntegerPolynomial(t, n, pp.secretkey_bound(), secret, randgen);

    std::vector<BICYCL::Mpz> shares;
    std::vector<unsigned int> indices;

    std::cout << "Generating shares...\n";
    for (int i = 1; i <= n; ++i) {
        shares.push_back(ip.evaluate(i));
        indices.push_back(i);
    }

    std::cout << "Reconstructing...\n";

    BICYCL::Mpz reconstructed = IntegerPolynomial::reconstruct(t, n, shares, indices);
    std::cout << "Reconstructed secret: " << reconstructed << std::endl;

    std::cout << "Generating dual polynomial...\n";
    IntegerDualPolynomial idp = IntegerDualPolynomial(t, n, pp.secretkey_bound(), randgen);

    std::cout << "Generating duals...\n";
    std::vector<BICYCL::Mpz> duals;

    for (int i = 1; i <= n; ++i) {
        duals.push_back(idp.evaluate(i, indices));
    }

    std::cout << "Verification: " << IntegerDualPolynomial::verification(shares, duals) << std::endl;
    return 0;
}