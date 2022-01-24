import std/monotimes
import std/strformat
import std/tables

import ./conversions
import ./globals

#[
  Boiler plate for Project Euler Solutions

  Usage:
    euler <problemID>:
      # setup code
      # This code should not be included in timing. Such as input sanitation
      # and parsing.

      solution:
        # solution code
]#
template euler*(problemID: int, body: untyped): untyped =
  block:
    SOLUTIONS[problemID] = proc(): (string, int64) =
      body

  when isMainModule:
    import std/tables
    import ../lib/conversions

    let (res, span) = SOLUTIONS[problemID]()

    echo "Result:      \e[34m" & res & "\e[0m"
    echo "Time Taken:  \e[32m" & span.toHumanTime & "\e[0m"

#[
  Boiler plat efor Project Euler Solutions bodies

  This is the code that will get timed.
  DO NOT include a return statement at the end of the body.
]#
template solution*(body: untyped): untyped =
  let startTime = getMonoTime()
  var res: AllowedType = block:
    body
  let endTime = getMonoTime()
  (res.toHuman, ticks(endTime) - ticks(startTime))
