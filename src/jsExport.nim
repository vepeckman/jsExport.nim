import jsffi, macros

var module {.importc, nodecl.}: JsObject

proc exportStatement(node: NimNode): NimNode =
  var name, id: NimNode
  if node.kind == nnkAsgn:
    name = node[0]
    id = node[1]
  elif node.kind == nnkIdent:
    name = node.toStrLit
    id = node
  result = quote do:
    module.exports[`name`] = `id`

macro jsExport*(body: untyped): untyped =
  result = newStmtList()
  result.add(quote do:
    if module.exports == jsNull or module.exports == jsUndefined:
      module.exports = newJsObject()
  )

  if body.len == 0:
    result.add(exportStatement(body))
  for node in body:
    if node.len > 0:
      if node.kind == nnkAsgn:
        result.add(exportStatement(node))
      elif node.kind == nnkPar:
        for child in node:
          result.add(exportStatement(child))
    else:
      result.add(exportStatement(node))
