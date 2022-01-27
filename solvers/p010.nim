import ../lib/globals
import ../lib/templates

import std/math
import ../lib/primes

euler 10:
  solution:
    sum(primeSieve(2_000_000))
