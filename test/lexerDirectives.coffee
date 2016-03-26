((x)->x)
    h1: (@_h1)-> @
    t: (@_t)-> @
    a: (@_a)-> @
    b: (@_b)-> @compare()
    compile: (x)->
      CoffeeScript.compile x catch err
        unless error? and 'object' is typeof error
          throw new Error 'Compiler error while compiling: ' + x
    compare: (a,b)->
      # test @_h1 + @_t, =>
      do=>
        a ?= @_a
        b ?= @_b
        # throw new Error('fuck') unless b?
        # CoffeeScript.compile(a)
        unless (a_c = @compile(a)) is (b_c = @compile(b))
            throw new Error """
              Code for #{a} was not compiled equivalently:
              
              #{ a_c }

              -vs-

              #{ b_c }"

              """
        1
      @
    done: ()-> 1
.h1 'Preprocessor directives (@@@@): '
.t 'Control'
.a
    ''''
.b
    ''''
.t 'Empty'
.a
    ''''
    @@@@
.b
    ''''
.t 'Single line'
.a
    ''''
    @@@@ 1
.b
    ''''
.t 'One line with newline'
.a
    ''''
    @@@@
      2
.b
    ''''
.t 'Multiple lines with newline'
.a
    ''''
    @@@@
      2
      3
      4
.b
    ''''
.t 'One line with newline and do'
.a
    ''''
    @@@@ do->
      2
.b
    ''''
.t 'With empty line'
.a
    ''''
    @@@@ do->
    
      2
.b
    ''''
.done()
