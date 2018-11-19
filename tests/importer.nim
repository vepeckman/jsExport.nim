import jsffi, unittest
import exporter

let nimMod = require(cstring("./exporter.js"))

suite "Exports":

  test "Assign export":
    check(nimMod.nimGreet(toJs "Test 1") == toJs "Hello Test 1")

  test "Named export":
    check(nimMod.greetPerson(Person(name: "Test 2", age: 0)) == toJs "Hello Test 2")

  test "Paren export":
    check(nimMod.nimGreet(nimMod.name) == toJs "Hello Test 3")
    check(nimMod.greetPerson(nimMod.person) == toJs "Hello Test 4")

  test "Nim object constructor export":
    check(nimMod.greetPerson(nimMod.newPerson("Test 5", 0)) == toJs "Hello Test 5")
