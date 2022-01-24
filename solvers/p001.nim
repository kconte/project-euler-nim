import ../lib/globals
import ../lib/templates

euler 1:
  func T(n: int): int = (n * (n + 1)) div 2

  solution:
    const LIMIT = 999
    var res = 0

    var tlim = LIMIT div 3
    res += 3 * T(tlim)

    tlim = LIMIT div 5
    res += 5 * T(tlim)

    tlim = LIMIT div 15
    res -= 15 * T(tlim)

    res
