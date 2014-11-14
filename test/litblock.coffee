((x)-> test "End-of-line literal block + reflective function", -> ok x.coffee is "()@>\n''''\na\n b\nc\n     d\n\ne\n\n\n " ) ()@>
''''
a
 b
c
     d

e


 
