namespace eval procs {
    
    namespace export reversed_filename run sets
    set version 0.1

    package require logger
    set log [logger::init main]
    logger::setlevel info
    
proc run {target codefilename inputfilename} {
    ${::log}::debug "procs::run $target $codefilename $inputfilename"
    
    switch $target {
        bf {
            if {$inputfilename != {}} {
            set out [exec bf $codefilename < $inputfilename]
            } else {
            set out [exec bf $codefilename]
            }
            ${::log}::debug "out $out"
            return $out
        }
        default {
            error "target $target"
        }
    }
}

proc sets args {
    set names [lrange $args 0 end-1]
    set values [lindex $args end]
    uplevel 1 [list foreach $names $values break]
    return [lrange $values [llength $names] end]
}

proc reversed_filename {reversed argfilename tmpfilename } {
    if {$reversed} {
        return [list $tmpfilename $argfilename]
    } 
    return [list $argfilename $tmpfilename]
}



}

package provide procs $procs::version
