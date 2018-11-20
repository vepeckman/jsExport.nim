# jsExport.nim
CommonJS exports for Nim

# What is this?
A simple Nim macro that allows you to export Nim procs and objects to JavaScript via CommonJS modules. The macro produces `module.exports` statements from the given input.

# Why is this?
This macro was written in order to descrease friction between Nim and the JavaScript ecosystem. By producing valid CommonJS modules, this macro makes it easier for JavaScript to consume Nim.

# Examples
```nim
jsExport:
  "nimGreet" = greet # export with a different name
  greetPerson # export with the same name
  (name, person) # comma seperated list of exports
```
