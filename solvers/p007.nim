import ../lib/globals
import ../lib/templates

import ../lib/primes

euler 7:
  solution:
    var
      num = 1
      count = 1

    while count != 10001:
      inc(num, 2)
      if num.isPrime:
        inc(count)

    num
