import std/tables
import std/strformat
import std/strutils

import ./lib/conversions
import ./lib/globals

const
  TL_CORNER: string = "\u250c"
  BL_CORNER: string = "\u2514"
  TR_CORNER: string = "\u2510"
  BR_CORNER: string = "\u2518"

  V_BAR: string = "\u2502"
  H_BAR: string = "\u2500"

  T_TBAR: string = "\u252c"
  L_TBAR: string = "\u251c"
  R_TBAR: string = "\u2524"
  B_TBAR: string = "\u2534"

  CROSS_BAR: string = "\u253c"

  COLOR_RESET: string = "\e[0m"
  COLOR_RED: string = "\e[31m"
  COLOR_GREEN: string = "\e[32m"
  COLOR_YELLOW: string = "\e[33m"
  COLOR_CYAN: string = "\e[36m"

  TIME_COL_WIDTH: int = 10
  RES_COL_WIDTH: int = 24

# Import each problem
# PROBLEM IMPORT

# helper functions
func rowSep(): string =
  result = L_TBAR
  result &= H_BAR.repeat(4)
  result &= CROSS_BAR
  result &= H_BAR.repeat(RES_COL_WIDTH)
  result &= CROSS_BAR
  result &= H_BAR.repeat(TIME_COL_WIDTH)
  result &= R_TBAR

func headSep(): string =
  result = TL_CORNER
  result &= H_BAR.repeat(4)
  result &= T_TBAR
  result &= H_BAR.repeat(RES_COL_WIDTH)
  result &= T_TBAR
  result &= H_BAR.repeat(TIME_COL_WIDTH)
  result &= TR_CORNER

func footSep(): string =
  result = BL_CORNER
  result &= H_BAR.repeat(4)
  result &= B_TBAR
  result &= H_BAR.repeat(RES_COL_WIDTH)
  result &= B_TBAR
  result &= H_BAR.repeat(TIME_COL_WIDTH)
  result &= BR_CORNER

proc echoHeader(): void =
  echo headSep()

  var header: string = V_BAR
  header &= "ID".center(4) & V_BAR
  header &= "Result".center(RES_COL_WIDTH) & V_BAR
  header &= "Time".center(10) & V_BAR

  echo header

proc echoFooter(): void =
  echo footSep()

proc echoResult(id: int): void =
  echo rowSep()

  let (res, span) = SOLUTIONS[id]()

  var row: string = V_BAR
  row &= ($id).align(4) & V_BAR
  row &= COLOR_CYAN & res.alignLeft(RES_COL_WIDTH) & COLOR_RESET & V_BAR

  var color = COLOR_GREEN
  if span >= 1_000_000_000'i64:
    color = COLOR_RED
  elif span >= 100_000_000'i64:
    color = COLOR_YELLOW

  row &= color & span.toHumanTime.center(TIME_COL_WIDTH) & COLOR_RESET & V_BAR

  echo row

# Output the results
echoHeader()
for id in SOLUTIONS.keys:
  echoResult(id)
echoFooter()
