<?php
# Author: Benjamin Oakes <hello@benjaminoakes.com>

if (date()) {
  echo 'true';
} else {
  echo 'false';
}

$mktime = mktime();
echo('$mktime: ' . print_r($mktime, true) . "\n");

