import ../lib/globals
import ../lib/templates

euler 2:
  solution:
    var
      res = 0
      a = 1
      b = 1
      fib = 2

    while fib < 4_000_000:
      res += fib
      a = b + fib
      b = fib + a
      fib = a + b

    res
