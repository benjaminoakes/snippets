#!/usr/bin/env bash
# Made to figure out scopes in bash.
# 
# Author: Benjamin Oakes <hello@benjaminoakes.com>

function greet {
  name=$1
  echo "Hello, $name!"
  echo "x: $x"
  x=4
}

x=3
greet 'Bill Clinton'
echo "x: $x"

