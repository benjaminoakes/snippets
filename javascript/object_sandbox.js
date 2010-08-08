// Author: Benjamin Oakes <hello@benjaminoakes.com>

function Cat() {
  this.speak = function() {
    console.log("Miaou!");
  };
}

var fuzzard = new Cat();
fuzzard.speak();

