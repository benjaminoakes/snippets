<?php
# Author: Benjamin Oakes <hello@benjaminoakes.com>

$counts = array();

$file = fopen('saved_searches.txt', 'r');

while (!feof($file)) {
  $line = fgets($file);
  $unserialized = unserialize($line);
  # print_r($unserialized);

  $view = $unserialized['search'];
  if ($counts[$view]) {
    $counts[$view] = $counts[$view] + 1;
  } else {
    $counts[$view] = 1;
  }
}

fclose($file);

foreach($counts as $view => $count) {
  printf("%s: %d\n", $view, $count);
}

