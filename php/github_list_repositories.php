<?php
# List GitHub repositories for a user
# 
# Author: Benjamin Oakes <hello@benjaminoakes.com>

include_once 'spyc.php';

$file = fopen('http://github.com/api/v2/yaml/repos/show/benjaminoakes', 'r');                           

$yaml = '';
# TODO something like Ruby's File.readlines
while ($line = fgets($file)) {
    $yaml .= $line;
}

fclose($file);

# Spyc doesn't deal with symbols as keys very well...
$yaml = preg_replace('/- :/', '- $1', $yaml);
$yaml = preg_replace('/  :/', '  ', $yaml);
# I thought something like gsub(/^(\s+):/, '\1') would have done this better, but PHP hates me and didn't want to make that work... :(

# YAMLLoad give the GitHub repositories as an array like this:
# 
#   [4] => Array
#       (
#           [description] => Website for bostonrb.org
#           [has_issues] => 
#           [watchers] => 1
#           [has_wiki] => 1
#           [url] => http://github.com/benjaminoakes/bostonrb
#           [homepage] => http://bostonrb.org
#           [fork] => 1
#           [open_issues] => 0
#           [private] => 
#           [name] => bostonrb
#           [forks] => 0
#           [owner] => benjaminoakes
#           [has_downloads] => 1
#       )
# 
$repositories = Spyc::YAMLLoad($yaml);

# Dunno what this key is for:
unset($repositories['repositories']);

echo('$repositories: ' . print_r($repositories, true) . "\n");

