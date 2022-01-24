import ../lib/globals
import ../lib/templates

euler 3:
  solution:
    var
      limit = 600_851_475_143'u64
      i = 2'u64

    while limit > i:
      while limit mod i == 0:
        limit = limit div i
      inc(i)

    max(limit, i)
