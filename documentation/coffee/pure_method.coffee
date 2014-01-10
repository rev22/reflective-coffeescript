mouse = new Prey

# Now create an object accurately describing a feline
Feline =
  prey: null
  hunt: (prey) @>
    # 'mouse' will not be accessible in this method

    # Uncommenting the following line will result in a compiler error
    # return mouse unless @prey

    # But we can access the object's property, or a method's argument
    if prey
      @prey = prey
    else
      prey = @prey

    return prey unless prey.isLive()
