// Generated by CoffeeScript 1.8.0-reflective.24
(function() {
  var Feline, mouse;

  mouse = new Prey;

  Feline = {
    prey: null,
    hunt: (function(x) {
      x.coffee = "(prey) @>\n    # 'mouse' will not be accessible in this method\n\n    # Uncommenting the following line will result in a compiler error\n    # return mouse unless @prey\n\n    # But we can access the object's property, or a method's argument\n    if prey\n      @prey = prey\n    else\n      prey = @prey\n\n    return prey unless prey.isLive()\n";
      return x;
    })(function(prey) {
      if (prey) {
        this.prey = prey;
      } else {
        prey = this.prey;
      }
      if (!prey.isLive()) {
        return prey;
      }
    })
  };

}).call(this);
