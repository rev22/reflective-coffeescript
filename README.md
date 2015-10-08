
            {                    _||          |  _)
         }   }   {        _|-_)  _||  -_)  _|  _| |\ \ / -_)
        {   {  }  }     _|\___|_| _|\___|\__|\__|_| \_/\___|
         }   }{  {
        {  }{  }  }                    _____       __  __
       ( }{ }{  { )                   / ____|.... / _|/ _|
     .- { { }  { }} -.              .| |     ___ | |_| |_ ___  ___
    (  ( } { } { } }  )            ( | |    / _ \|  _|  _/ _ \/ _ \
    |`-.._________..-'|            |'| |___| (_) | | | ||  __/  __/
    |                 |            |  \_____\___/|_| |_| \___|\___|
    |                 ;--.      .--:                 :
    |                (__  \    /  __)  _____         : _       _
    |                 | )  )  (  ( |  / ____|        :(_)     | |
    |                 |/  /    \  \| | (___   ___ _ __ _ _ __ | |_
    |                 /  /      \  \  \___ \ / __| '__| | '_ \| __|
    |                 _/          \_  ____) | (__| | :| | |_) | |_
    |                 |            | |_____/ \___|_| :|_| .__/ \__|
     `-.._________..-'              `-.._________..-'   | |
                                                        |_|

This experimental fork adds reflective features to Coffeescript

Reflective CoffeeScript aims to be fully compatible with the
upstream, vanilla CoffeeScript.

Features added to reflective-coffeescript:

* Reflective function
  
The syntax @> introduces reflective functions:

```coffee
square = (x)@> x * x
```

Reflective functions work similarly to standard CoffeeScript
functions:

```coffee
square(2) is 4
```

but have their own CoffeeScript source code as a property:

```coffee
square.coffee is "(x)@> x * x"
```
    
Reflective functions can only access 'this' and arguments.

Attempting to access a global variable or a lexical variable defined
in an outer scope will result in a compiler error.

```coffee
x = 1
@> x   # Compiler error
```

As an automatic extra feature, the 'do @>' syntax can be used to
fully isolate the lexical scope of a block of code.

```coffee
x = 1                       x = 1
do -> x = 2                 do @> x = 2
console.log x # prints 2    console.log x # prints 1

x = 1                       x = 1
do @>                       do (x) @>
  x = x * 3                   x = x * 3
  #   ^-- compiler error      console.log x  # prints 3
                                console.log x    # prints 1
```
				
Additional ideas are included in ROADMAP.org


## Licensing and Copyright status

The original CoffeeScript is:

    Copyright (c) 2009-2013 Jeremy Ashkenas

The Reflection-related modifications are:

    Copyright (c) 2013-2015 Michele Bini

Please consult LICENSE for licensing details and about the lack of
explicit or implied warranty.


# CoffeeScript's README

CoffeeScript is a little language that compiles into JavaScript.

## Installation

If you have the node package manager, npm, installed:

```shell
npm install -g coffee-script
```

Leave off the `-g` if you don't wish to install globally. If you don't wish to use npm:

```shell
git clone https://github.com/jashkenas/coffeescript.git
sudo coffeescript/bin/cake install
```

## Getting Started

Execute a script:

```shell
coffee /path/to/script.coffee
```

Compile a script:

```shell
coffee -c /path/to/script.coffee
```

For documentation, usage, and examples, see: http://coffeescript.org/

To suggest a feature or report a bug: http://github.com/jashkenas/coffeescript/issues

If you'd like to chat, drop by #coffeescript on Freenode IRC.

The source repository: https://github.com/jashkenas/coffeescript.git

Changelog: http://coffeescript.org/#changelog

Our lovely and talented contributors are listed here: http://github.com/jashkenas/coffeescript/contributors
