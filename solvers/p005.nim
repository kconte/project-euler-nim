import ../lib/globals
import ../lib/templates

import std/tables
import ../lib/primes

#[
  To find the smallest multiple of all positive integers in the range [1,n],
  find a number that has the highest multiples of each prime factor.

  That is, for the smallest multiple of all positive integers in [1,4], find
  the prime factors of each number in [2,4]. (exclude 1 since 1 is not prime
  and any number times 1 is the identity property).

  2: 2
  3: 3
  4: 2*2

  So, our prime factors are 2 and 3. Note that 4 has two factors of 2. To
  find the smallest multiple, take the largest count of each prime factor
  and multiply it together. Like so:

  SM = 2*2 * 3

  Since 4 as more multiples of 2 than 2, the multiples of 2 will be included
  by including 4.

  Thus, the smallest multiple of all positive integers in [1,4] is 12.
]#

euler 5:
  func smallestMultiple(num: int): int =
    result = 1
    for prime in primeSieve(num):
      var prod = 1
      while prod <= num:
        prod *= prime
      prod = prod div prime
      result *= prod

  solution:
    20.smallestMultiple
