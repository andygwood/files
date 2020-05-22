function jailWatch(){
 for var in "$@"
 do
     ~/Applications/Unison.app/Contents/MacOS/Unison -ui text -batch -repeat watch $var &
 done
}

function jailSync(){
 for var in "$@"
 do
     ~/Applications/Unison.app/Contents/MacOS/Unison -ui text -batch $var &
 done
}
