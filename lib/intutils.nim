func isqrt*(n: SomeInteger): SomeInteger =
  if n < 0:
    raise newException(ValueError, "'n' cannot be negative")
  var
    l: typeof(n) = 1
    m: typeof(n) = 0
    u: typeof(n) = n + 1

  while l != (u - 1):
    m = (l + u) div 2
    if m * m <= n:
      l = m
    else:
      u = m

  l

func nDivisors*(n: SomeInteger): SomeInteger =
  if n < 0:
    raise newException(ValueError, "'n' cannot be negative")

  if n == 0: return 0
  if n == 1: return 1

  result = 2
  let ulimit = n.isqrt
  for i in 2..ulimit:
    if n mod i == 0:
      inc(result)
      if i * i != n:
        inc(result)
