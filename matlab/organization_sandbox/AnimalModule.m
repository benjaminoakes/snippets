function module = AnimalModule(self)
  module.walk = @walk;
  module.eat = @eat;
  
  function walk()
    disp(strcat(self.get_name(), ' is walking...'));
  end

  function eat()
    disp(strcat(self.get_name(), ' is eating...'));
  end
end

