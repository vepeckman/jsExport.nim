import jsffi
import ../src/jsExport

proc greet(name: cstring): cstring =
  "Hello " & name

jsSingleExport(greet)
