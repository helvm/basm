#!/usr/bin/tclsh

#bf [-h] [options] <filename>

package require logger
set log [logger::init main]
logger::setlevel info

#puts "::argv0 $::argv0"

set dir [string last "/" $::argv0 ]
set dir [string range $::argv0 0 $dir]
${::log}::debug "dir $dir"

lappend ::auto_path $dir

#package require cmdline
#namespace import ::cmdline::getopt

package require getopt
namespace import ::getopt::getopt

package require procs
namespace import ::procs::*

package require tempfile
namespace import ::tempfile::*


#global verbosity
#global version
set verbosity 0
set version 0.1
set target no
set reversed no
set files [list]
set bool_input yes

proc help {} {
    puts "This is my help for you"
    puts "-h"
    puts "-v"
    puts "-V"
    puts "-t=target"
    puts "codefilename inputfilename outputfilename"
    puts --noinput
    
}

proc my_getopt {} {
    ${::log}::debug "my_getopt"
    global argv
getopt flag arg $argv {
    -h? - --help {
        # The user wants some help
        help
    }
    -v {
        # Increase the verbosity level
        global verbosity
        incr verbosity
    }
    --verbose: {
        # Set the verbosity level
        global verbosity
        set verbosity $arg
    }
    -V - --version {
        # Report the version of the program
        global version
        ${::log}::debug "Version: $version"
        exit 0
    }
    -t: - --target: {
        global target
        set target $arg
        ${::log}::debug "Target: $target"      
    }
    -r - --reversed {
        global reversed
        set reversed true
    }
    --noinput {
        global bool_input
        set bool_input no
    }
    missing {
        puts stderr "option requires argument: $arg"
        exit 2
    }
    arglist {
        global files
        set files $arg
    }
}
#    -ptrb:g: {
#        # Various other options
#        set option($flag) $arg
#    }
#    unknown {
#        puts stderr "unknown or ambiguous option: $arg"
#        exit 2
#    }
}

my_getopt

set argfilename [lindex $files 0]

set tmpfilename [input_file $bool_input]

sets codefilename inputfilename [reversed_filename $reversed $argfilename $tmpfilename]

puts [run $target $codefilename $inputfilename]
