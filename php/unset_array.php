<?php
# I'm always somewhat annoyed that PHP doesn't give you a "real" array.  Instead, you have associative arrays (hashes).
# 
# PHP will fake something *similar* to an indexed array.  This is a demonstration of how you can mess it up.
# 
# Author: Benjamin Oakes <hello@benjaminoakes.com>

$test = array("one", "two", "three");
var_dump($test);

unset($test[1]);
var_dump($test);

# The array indices will be off here!
array_push($test, "four");
var_dump($test);

