namespace eval tempfile {
    
    namespace export *
    set version 0.1
    
    package require logger
set log [logger::init main]
logger::setlevel info

proc new_tempfile {} {
    set tmpdir [pwd]
    if {[file exists "/tmp"]} {set tmpdir "/tmp"}
    catch {set tmpdir $::env(TRASH_FOLDER)} ;# very old Macintosh. Mac OS X doesn't have this.
    catch {set tmpdir $::env(TMP)}
    catch {set tmpdir $::env(TEMP)}
    set filename [file join $tmpdir [pid]]
    return $filename
}

proc write {filename code} {
    set fo [open $filename "w"]
    puts $fo $code
    close $fo
}

proc new_init_tempfile {code} {
    set filename [tempfile::new_tempfile]
    tempfile::write $filename $code
    return $filename
}

proc input_file {bool_input} {
    set tmpfilename [new_tempfile]
    set fp [open $tmpfilename w]
    if {$bool_input} {
        while { 0 <= [gets stdin data] } {
            puts $fp $data
        }
    }
    close $fp
    return $tmpfilename
}

}

package provide tempfile $tempfile::version
