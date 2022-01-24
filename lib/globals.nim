import std/tables

# Global values shared between solutions

# A table relating problem IDs with solutions
var SOLUTIONS*: OrderedTable[int, proc(): (string, int64)]

# A special value indicating that a solution is not implemented
type NYI* = enum NotImplemented
