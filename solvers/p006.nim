import ../lib/globals
import ../lib/templates

import std/math

euler 6:
  func T(n: int): int = (n * (n + 1)) div 2
  func Ts(n: int): int = (2 * n + 1) * T(n) div 3

  solution:
    const n = 100
    T(n)^2 - Ts(n)
