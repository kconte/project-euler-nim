import std/algorithm
import std/enumerate
import std/sequtils

func isqrt(val: SomeInteger): SomeInteger =
  var
    l: typeof(val) = 1
    m: typeof(val) = 0
    u: typeof(val) = val + 1

  while l != (u - 1):
    m = (l + u) div 2
    if m * m <= val:
      l = m
    else:
      u = m

  l

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
