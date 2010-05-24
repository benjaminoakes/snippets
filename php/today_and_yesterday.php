<?php
# Author: Benjamin Oakes <hello@benjaminoakes.com>

date_default_timezone_set('UTC');

$today_date = date('Y-m-d');
$today_timestamp = strtotime($today_date);

$yesterday_date = date('Y-m') . '-' . (date('d') - 1);
$yesterday_timestamp = strtotime($yesterday_date);

