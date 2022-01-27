import ../lib/globals
import ../lib/templates

import std/math
import std/strutils

import ../lib/grid

euler 11:
  const grid = readFile("./inputs/p011.txt").strip.toIntGrid
  const WINSIZE = 4

  solution:

    var res = 0

    let nrows = len(grid)
    let ncols = len(grid[0])

    # Horizontal checks
    for row in grid.rows:
      for j in 0..(ncols - WINSIZE):
        res = max(res, row[j..j + 3].prod)

    # Vertical checks
    for col in grid.cols:
      for i in 0..(nrows - WINSIZE):
        res = max(res, col[i..i + 3].prod)

    # Diagonal checks
    for i in 0..<nrows:
      for j in 0..<nrows:
        # diagonally down
        if i <= (nrows - 4) and j <= (ncols - 4):
          res = max(
            res,
            @[
              grid[i + 0][j + 0], grid[i + 1][j + 1],
              grid[i + 2][j + 2], grid[i + 3][j + 3]
            ].prod
          )

        # diagonally up
        if i >= 3 and j <= (ncols - 4):
          res = max(
            res,
            @[
              grid[i - 0][j + 0], grid[i - 1][j + 1],
              grid[i - 2][j + 2], grid[i - 3][j + 3]
            ].prod
          )


    res
