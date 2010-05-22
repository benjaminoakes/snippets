<?php
# Author: Benjamin Oakes <hello@benjaminoakes.com>

define(FOO, "bar");
define(FOO, "baz");

echo('FOO: ' . print_r(FOO, true) . "\n");

