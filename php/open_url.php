<?php
# It seems like there should be a better way of doing this...
# 
# Author: Benjamin Oakes <hello@benjaminoakes.com>

$file = fopen('http://github.com/api/v2/yaml/repos/show/benjaminoakes', 'r');

while ($line = fgets($file)) {
  echo $line;
}

fclose($file);

