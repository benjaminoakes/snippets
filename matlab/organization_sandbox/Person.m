% Person 'class' (struct + associated functions) for comparing against classdef.  Verdict: much faster than the "real" object orientation.
% 
% Author: Benjamin Oakes <benjamin.oakes@yale.edu>
function self = Person(name)
  % Constructor

  % Don't use public variables -- they don't propogate through!

  % Instance variables
  iv.name = name;

  % Private variables -- they change with the instance, but by convention, we use iv.var_name to indicate they're for the instance of the class
  private_variable = 'private!';

  % Accessors
  self.get_name = @get_name;
  self.set_name = @set_name;

  % Public methods
  self.say = @say;
  
  self.fn = @fn;
  self.stress_test = @stress_test;
  self.instance_variables = @instance_variables;
  
  include(self, AnimalModule(self));

  function name = get_name()
    name = iv.name;
  end

  function set_name(name)
    iv.name = name;
  end

  function iv = instance_variables()
  end

  function say(message)
    disp(private_variable);
    private_variable = 'new value';
    disp(private_variable);
    disp(private_method_example());
    disp(strcat(iv.name, ' says "', message, '"'));
  end

  % Private methods -- not set to class
  function secret = private_method_example()
    secret = 'You cannot see me!';
  end

  function value = fn()
    value = 123125 * 236234;
  end

  function time_to_complete = stress_test()
    tic;

    for i = 1:100000
      fn;
    end

    time_to_complete = toc;
  end
end

% % Person 'class' for comparing against classdef.  Verdict: much faster than the "real" object orientation.
% % 
% % Author: Benjamin Oakes <benjamin.oakes@yale.edu>
% function self = Person(name)
%   self
%   
%   % Constructor
% 
%   % Public variables -- don't use unless they're constant; changing them doesn't propogate through!
%   % self.name = name;
% 
%   % Private variables -- not set to self
%   its_name = name;
%   private_variable = 'private!';
% 
%   % Accessors
%   self.get_name = @get_name;
%   self.set_name = @set_name;
% 
%   % Public methods
%   self.say = @say;
%   
%   animal_module = AnimalModule(self);
%   self.walk = animal_module.walk;
% 
%   self.fn = @fn;
%   self.stress_test = @stress_test;
% 
%   function name = get_name()
%     name = its_name;
%   end
% 
%   function set_name(name)
%     its_name = name;
%   end
% 
%   function say(message)
%     disp(private_variable);
%     private_variable = 'new value';
%     disp(private_variable);
%     disp(private_method_example());
%     % disp(strcat(self.name, ' says "', message, '"'));
%     disp(strcat(its_name, ' says "', message, '"'));
%   end
% 
%   % Private methods -- not set to self
%   function secret = private_method_example()
%     secret = 'You cannot see me!';
%   end
% 
%   % Static methods
%   % 
%   % Current strategy: just ignore 'self'
%   function value = fn()
%     value = 123125 * 236234;
%   end
% 
%   function time_to_complete = stress_test()
%     tic;
% 
%     for i = 1:100000
%       fn;
%     end
% 
%     time_to_complete = toc;
%   end
% end
% 
