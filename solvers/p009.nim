import ../lib/globals
import ../lib/templates

euler 9:
  solution:

    var res = 0
    block outer:
      for a in 100..999:
        for b in 100..999:
          let c = 1000 - a - b
          if a * a + b * b == c * c:
            res = a * b * c
            break outer

    res
