import jsffi
import ../src/jsExport

type Person* = ref object
  name*: string
  age*: int

proc newPerson(name: cstring, age: cint): Person =
  Person(name: $name, age: int(age))

var name = cstring("Test 3")
var person =  Person(name: "Test 4", age: 0)

proc greet(name: cstring): cstring =
  "Hello " & name

proc greetPerson(person: Person): cstring =
  "Hello " & person.name

jsExport:
  "nimGreet" = greet
  greetPerson
  (name, person, newPerson)
