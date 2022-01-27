import std/algorithm
import std/enumerate

import ./intutils

func isPrime*(val: SomeInteger): bool =
  if val < 2: return false
  elif val == 2: return true
  elif val mod 2 == 0: return false

  for i in countup(3, val.isqrt, 2):
    if val mod i == 0:
      return false
  return true

func primeSieve*(limit: SomeInteger): seq[SomeInteger] =
  var isPrime: seq[bool] = newSeq[bool](limit + 1)
  isPrime.fill(true)
  isPrime[0] = false
  isPrime[1] = false

  let ubound = limit.isqrt
  for i in 2..ubound:
    if isPrime[i]:
      for j in countup(i * i, limit, i):
        isPrime[j] = false

  for (i, val) in enumerate(isPrime):
    if val:
      result.add(typeof(limit)(i))

  result
