test "Transignment operators: >. <. .< .>", ->
  ((x)-> x)
    a: (@_a)-> @
    b: (@_b)-> @compare()
    compare: (a, b)->
      a ?= @_a
      b ?= @_b
      unless CoffeeScript.compile(a) is CoffeeScript.compile(b)
        throw "Code for #{a} was not compiled equivalently"
      @
    finish: ()-> 1
  .a
    ''''
    a .< b
  .b
    ''''
    a.b = b
  .a
    ''''
    a <. b
  .b
    ''''
    a = b.a
  .a
    ''''
    a .> b
  .b
    ''''
    b = a.b
  .a
    ''''
    a >. b
  .b
    ''''
    b.a = a
  .a
    ''''
    { a } = @
  .b
    ''''
    a <. @
  .a
    ''''
    { a } = @
  .b
    ''''
    @ .> a
  .a
    ''''
    a >. @
  .b
    ''''
    @a = a
  .a
    ''''
    @ .< a
  .b
    ''''
    @a = a
  .finish()
