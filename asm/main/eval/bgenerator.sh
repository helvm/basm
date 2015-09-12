#!/bin/sh
# -*- tcl -*-
# The next line is executed by /bin/sh, but not tcl \

tclsh bgeneratorInstr.tcl > ../generated/bInstr.tcl
tclsh bgeneratorProc.tcl > ../generated/bProc.tcl
