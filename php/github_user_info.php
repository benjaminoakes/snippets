<?php
# Use the GitHub API to get counts of public repos and followers.
#
# Author: Benjamin Oakes <hello@benjaminoakes.com>

include_once('spyc.php');

$file = fopen('http://github.com/api/v2/yaml/user/show/benjaminoakes', 'r');

$yaml = '';
# TODO something like Ruby's File.readlines
while ($line = fgets($file)) {
    $yaml .= $line;
}

fclose($file);
$unserialized_yaml = Spyc::YAMLLoad($yaml);
$user_info = $unserialized_yaml['user'];

echo('$user_info: ' . print_r($user_info, true) . "\n");

