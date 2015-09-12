#!/usr/bin/tclsh

#package ifneeded futil 0.1 [list source [file join $dir futil.tcl]]

package ifneeded getopt 0.1 [list source [file join $dir getopt.tcl]]
package ifneeded procs 0.1 [list source [file join $dir procs.tcl]]
package ifneeded tempfile 0.1 [list source [file join $dir tempfile.tcl]]


