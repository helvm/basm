#!/usr/bin/tclsh

lappend ::auto_path ../../slv/main 

package require tcltest 2
namespace import tcltest::*

package require logger
set log [logger::init main]

package require tempfile
namespace import ::tempfile::new_init_tempfile

set SLV "../../slv/main/slv.tcl"
