test "Then without If, Catch and Finally without Try", ->
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
    x = if a
    then b
    else c
  .b
    ''''
    x = if a then b else c
  .a
    ''''
    a then b
  .b
    ''''
    if a then b
  .a
    ''''
    a then b else c
  .b
    ''''
    if a then b else c
  .a
    ''''
    a() then b() else
      c()
      d()
  .b
    ''''
    if a()
      b()
    else
      c()
      d()
  .a
    ''''
    a() then
      b()
    else
      c()
      d()
  .b
    ''''
    if a()
      b()
    else
      c()
      d()
  .a
    ''''
    a then b then c
  .b
    ''''
    if a then if b then c
  .a
    ''''
    foo() catch error
      console.log error
  .b
    ''''
    try
      foo()
    catch error
      console.log error
  .a
    ''''
    foo() finally bar()
  .b
    ''''
    try
      foo()
    finally
      bar()
  .a
    ''''
    foo() finally bar() finally baz()
  .b
    ''''
    try
      foo()
    finally
      try
        bar()
      finally
        baz()
  .a
    ''''
    a() finally b() finally c() finally d() finally e()
  .b
    ''''
    try
      a()
    finally
      try
        b()
      finally
        try
          c()
        finally
          try
            d()
          finally
            e()
  .a
    ''''
    try catch err then finally
  .b
    ''''
    try
    catch err
    finally
  .a
    ''''
    foo() finally
      bar()
      baz()
  .b
    ''''
    try
      foo()
    finally
      bar()
      baz()
  .a
    ''''
    foo() catch x
      bar()
      baz()
  .b
    ''''
    try
      foo()
    catch x
      bar()
      baz()
  .a
    ''''
    foo() catch x
      bar()
      baz()
    finally
      quvw()
      zzzz()
  .b
    ''''
    try
      foo()
    catch x
      bar()
      baz()
    finally
      quvw()
      zzzz()
  .a
    ''''
    foo() catch y
      bar()
      baz()
    finally
      quvw()
      zzzz()
  .b
    ''''
    try
      foo()
    catch y
      bar()
      baz()
    finally
      quvw()
      zzzz()
  .a
    ''''
    foo() catch y then bar() finally baz()
  .b
    ''''
    foo() catch y then bar() finally
      baz()
  .a
    ''''
    foo() catch y then bar() finally
      baz()
      q()
  .b
    ''''
    try foo()
    catch y
      bar()
    finally
      baz()
      q()
  .finish()
