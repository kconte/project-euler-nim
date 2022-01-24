#!/usr/bin/env python3
from io import TextIOWrapper
from pathlib import Path
from os import listdir
import re

def writeline(f: TextIOWrapper, msg: str = ""):
  f.write(msg + "\n")


regex = re.compile(r"^p\d{3}\.nim$")
solvers = sorted(list(filter(regex.match, listdir("solvers"))))

with open("all.nim.template") as f:
  template = f.read().strip().split("\n")

with open("all.nim", "w") as f:
  for line in template:
    if line != "{{ PROBLEM IMPORT }}":
      writeline(f, line)
    else:
      for solver in solvers:
        solver = solver.replace(".nim", "")
        writeline(f, f"import ./solvers/{solver}")


with open("Makefile", "w") as f:
  writeline(f, "NIM_CFLAGS = -d:release --warning:UnusedImport:off")
  writeline(f)

  writeline(f, "all: bin/all")
  writeline(f, "bin/all: all.nim")
  writeline(f, "\tnim c $(NIM_CFLAGS) -o:$@ $^")
  writeline(f)

  for solver in solvers:
    problemID = int(solver[1:-4])

    writeline(f, f".PHONY: {problemID}")
    writeline(f, f"{problemID}: bin/{problemID}")
    writeline(f, f"bin/{problemID}: solvers/{solver}")
    writeline(f, "\tnim c $(NIM_CFLAGS) -o:$@ $<")
    writeline(f)

  writeline(f, "clean:")
  writeline(f, "\t$(RM) bin/*")
  writeline(f, ".PHONY: clean all")

  pass

Path("./bin").mkdir(exist_ok = True)
