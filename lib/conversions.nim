import std/strformat

import ./globals

# Types that can be formated to a human string
type AllowedType* = NYI | SomeInteger | string


# Formats an integer with commas
proc toHuman*(v: SomeInteger): string =
  when v is SomeSignedInt:
    let isNeg = v < 0
    let v = if isNeg: (not v).uint64 + 1
            else: v.uint64
    return if isNeg: "-" & v.toHuman
           else: v.toHuman
  else:
    var rem = v
    if rem == 0: return "0"

    result = &"{rem mod 1_000:03}"
    rem = rem div 1_000
    while bool(rem):
      result = &"{rem mod 1_000:03},{result}"
      rem = rem div 1_000

    while result[0] == '0':
      result = result[1..^1]

proc toHuman*(v: string): string = v

proc toHuman*(v: NYI): string = "solution not implemented"

# Constants used in conversions
const
  BILLION = 1_000_000_000'i64
  MILLION = 1_000_000'i64
  THOUSAND = 1_000'i64

# Converts a timespan (in nanoseconds) to a human-readable string
proc toHumanTime*(span: int64): string =
  if span >= BILLION:
    let sec = span div BILLION
    let mil = (span mod BILLION) div MILLION
    return &"{sec}.{mil:03} sec"
  elif span >= MILLION:
    let mil = span div MILLION
    let mic = (span mod MILLION) div THOUSAND
    return &"{mil}.{mic:03} ms"
  elif span >= THOUSAND:
    let mic = span div THOUSAND
    let ns = span mod THOUSAND
    return &"{mic}.{ns:03} \u03bcs"
  else:
    return &"{span} ns"
