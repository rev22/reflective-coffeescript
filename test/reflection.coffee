# Copyright (c) 2013, 2014, 2015 Michele Bini

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
  fooString = "@>\n    @console.log \"hello\"\n  "
  ok (foo.coffee is fooString)

test "Declaration of variables in 'while' statements", ->
  ok do->
    try
      c = CoffeeScript.compile """
        @>
          while (x = @foo())?
            @foo(x)
        """
    catch error
      c = false
    !!c

test "Verify globals marked with @@", ->
  CoffeeScript.compile "@>@@Math"
  CoffeeScript.compile "->Math"
  CoffeeScript.compile "->@@Math"
  ok do (caught = false)->
    try
      CoffeeScript.compile "@>Math"
    catch
      caught = true
    caught

