<?php
# Author: Benjamin Oakes <hello@benjaminoakes.com>

$class = __CLASS__;

echo '$class: ' . $class . "\n";

class TestClass
{
  public static function test_static_function()
  {
    echo "Hello!\n";

    $class = __CLASS__;
    echo '$class: ' . $class . "\n";
  }
}

TestClass::test_static_function();

