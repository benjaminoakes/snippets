<?php
# Author: Benjamin Oakes <hello@benjaminoakes.com>

$an_array = array();

$i = 0;
while ($i < 10)
{
    print $i ."\n";
    $an_array[] = $i;
    $i++;
}

print_r($an_array)

