#!/usr/bin/tclsh



set fp [open "somefile" r]
set file_data [read $fp]
close $fp

#  Process data file
set data [split $file_data "\n"]
foreach line $data {
# do some line processing here

}
 