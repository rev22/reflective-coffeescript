test "Verify catching impure reflective functions", ->
  CoffeeScript.compile "@>@foo"
  CoffeeScript.compile "->foo"
  ok do (caught = false)->
    try
      CoffeeScript.compile "@>foo"
    catch
      caught = true
    caught
  ok do (caught = false)->
    try
      CoffeeScript.compile "@>->foo"
    catch
      caught = true
    caught
    

test "Verify reflective functions source", ->
  ok ((@>).coffee is "@>")
  ok ((()@>@).coffee is "()@>@")
  ok (((x)@>x).coffee is "(x)@>x")
  foo = @>
    @console.log "hello"
  fooString = "@>\n    @console.log \"hello\""
  ok (foo.coffee is fooString)
