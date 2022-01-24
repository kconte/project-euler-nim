import ../lib/globals
import ../lib/templates

euler 4:

  func isPalindrome(val: int): bool =
    var
      tmp = 0
      copy = val
    while bool(copy):
      tmp *= 10
      tmp += (copy mod 10)
      copy = copy div 10
    return tmp == val

  solution:
    var res = 0

    #[
      All palindromes that are the product of two 3-digit numbers are in the
      range: [111111, 999999]; that is, a 6-digit number with no leading zeros.

      Thus, for any palindrome, P, P takes the form:

      P = 100000x + 10000y + 1000z + 100z + 10y + x
        = 100001x + 10010y + 1100z
        = 11(9091x + 910y + 100z)

      Therefore, P is divisible by 11, a prime number. Thus, for any two 3-digit
      integers, a and b where a * b is a palindrome, 11|a or 11|b.
    ]#

    for a in countdown(999, 100):
      let (ub, db) = if a mod 11 == 0: (999, 1)
                     else: (990, 11)

      for b in countdown(ub, 100, db):
        let c = a * b
        if c <= res: break
        if c.isPalindrome: res = c

    res
