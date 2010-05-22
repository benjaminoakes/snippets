# Author: Benjamin Oakes <hello@benjaminoakes.com>

require 'rubygems'
require 'inline'

inline(:C) do |builder|
  builder.c %{
    struct foo {
      int blah;
    } bar;
    
    void blah() {
      puts("hello world");
    }
  }
end

