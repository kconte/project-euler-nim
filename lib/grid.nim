import std/strutils

# Grid is simply a wrapper around a two-dimensional sequence
type Grid*[T] = seq[seq[T]]

#[
  Converts a string to a Grid of type int.
  Each logical row is line-separated.
  Each logical column is space-separated.
]#
func toIntGrid*(raw: string): Grid[int] =
  for line in raw.splitLines:
    var row: seq[int]
    let vals = line.split(" ")
    for val in vals:
      row.add(val.parseInt)
    result.add(row)

  # Ensures consistent number of columns in each row
  if bool(len(result)):
    let rowLen = len(result[0])
    for row in result:
      assert(len(row) == rowLen, "Grid width is not consistent")

# iterates over the logical rows of the grid
iterator rows*[T](grid: Grid[T]): seq[T] =
  for row in grid:
    yield row

# iterates over the logical columns of the grid
iterator cols*[T](grid: Grid[T]): seq[T] =
  let ncols = len(grid[0])
  for j in 0..<ncols:
    var col: seq[T]
    for i in 0..<len(grid):
      col.add(grid[i][j])
    yield col
