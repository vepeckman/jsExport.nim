# Package

version       = "0.0.1"
author        = "nepeckman"
description   = "CommonJS exports for Nim"
license       = "MIT"
srcDir        = "src"


# Dependencies

requires "nim >= 0.19.0"

task test, "Tests JavaScript exports":
  exec "nimble js -d:nodejs -o:build/exporter.js tests/exporter.nim"
  exec "nimble js -d:nodejs -o:build/importer.js tests/importer.nim"
  exec "nimble js -d:nodejs -o:build/singleExporter.js tests/singleExporter.nim"
  exec "node build/importer.js"
