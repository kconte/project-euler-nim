import ../lib/globals
import ../lib/templates

import ../lib/intutils

euler 12:
  solution:
    var
      res = 0
      i = 1

    while true:
      inc(res, i)
      if res.nDivisors >= 500: break
      inc(i)

    res
