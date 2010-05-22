% Woof!  Woof!
% 
% Author: Benjamin Oakes <benjamin.oakes@yale.edu>
classdef Dog
  properties
    name
    age
  end

  methods(Static)
    function prod = mult
      prod = 123123 * 12314;
    end

    function stress_test
      tic
      for i = 1:100000
        Dog.mult;
      end
      toc
    end
  end

  methods
    function self = Dog(name)
      self.name = name;
      % self.age = age
    end

    function bark(self)
      disp(strcat(self.name, ' says "Woof!"'));
    end
  end
end

