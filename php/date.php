<?php
# Author: Benjamin Oakes <hello@benjaminoakes.com>

$_POST['date'] = 'January 2008';

$specified_date = strtotime($_POST['date']);

if (empty($specified_date))
{
    throw new Exception('Malformed Date');
}

$specified_year = date('Y', $specified_date);
$specified_month = date('n', $specified_date);

$todays_year =  date('Y');
$todays_month = date('n');

$month_difference = ($specified_month - $todays_month) + (($specified_year - $todays_year) * 12);

echo $month_difference;
echo "\n";

