<?
# "Inflections" on strings, kind of like Rails.
# 
# Author: Benjamin Oakes <hello@benjaminoakes.com>

function str_contains($needle, $haystack)
{
   return (strpos($haystack, $needle) !== false);
}

function humanize($value)
{
  $value = ucfirst(str_replace('_', ' ', $value));
  $value = strip_extension($value);
  
  if (str_contains(' ', $value))
  {
    return $value;
  }
  else
  {
    return decamelize($value); 
  }
}

function titleize($value)
{
  return ucwords(ucfirst(str_replace('_', ' ', $value)));
}

function camelize($value)
{
  return str_replace(' ', '', titleize($value));
}

function decamelize($value)
{
  // echo '$value: ' . $value . "\n";
  $output = preg_replace('/([A-Z0-9]+)([A-Z0-9][a-z])/', '${1} ${2}', preg_replace('/([a-z\d])([A-Z0-9])/', '${1} ${2}', $value));
  // echo '$output: ' . $output . "\n";
  // echo '-------------------------------' . "\n";
  return $output;
}

function strip_extension($value)
{
  $pattern = '/(.*?)\.[a-z0-9]+/i';
  $replacement = '${1}';
  return preg_replace($pattern, $replacement, $value);
}

// "Unit testing" section

function assert_equal($expected, $actual)
{
  if (is_string($expected))
  {
    $expected = '\'' . $expected . '\'';
  }
  
  if (is_string($actual))
  {
    $actual = '\'' . $actual . '\'';
  }
  
  // assert_options() wasn't meeting my needs here
  assert($expected . ' == ' . $actual);
}

// $DecamelizedToCamelized = array(
//   'A Two-fold Test' => 'ATwo-foldTest',
//   'A two-fold test' => 'ATwo-foldTest',
//   'BDSCHED' => 'BDSCHED',
//   'Hello       World' => 'HelloWorld',
//   'Hello World' => 'HelloWorld',
//   'Hello_World' => 'HelloWorld',
//   'This Is 1 Test With Numbers' => 'ThisIs1TestWithNumbers',
//   'This is 1 test with numbers' => 'ThisIs1TestWithNumbers',
//   'This Is A Longer Test' => 'ThisIsALongerTest',
//   'This is a longer test' => 'ThisIsALongerTest',
//   'XML Thingy' => 'XMLThingy'
// );

assert_equal('HelloWorld', camelize('Hello World'));
assert_equal('HelloWorld', camelize('Hello_World'));
assert_equal('HelloWorld', camelize('Hello       World'));
assert_equal('ThisIsALongerTest', camelize('This is a longer test'));
assert_equal('ThisIs1TestWithNumbers', camelize('This is 1 test with numbers'));
assert_equal('ATwo-foldTest', camelize('A two-fold test'));
assert_equal('HelloWorld.doc', camelize('Hello World.doc'));

assert_equal('Hello World', decamelize('HelloWorld'));
assert_equal('This Is A Longer Test', decamelize('ThisIsALongerTest'));
assert_equal('This Is 1 Test With Numbers', decamelize('ThisIs1TestWithNumbers'));
assert_equal('A Two-fold Test', decamelize('ATwo-foldTest'));
assert_equal('FOOBAR', decamelize('FOOBAR'));
assert_equal('XML Thingy', decamelize('XMLThingy'));
assert_equal('YAML Thingy', decamelize('YAMLThingy'));
assert_equal('XML And YAML Thingy', decamelize('XMLAndYAMLThingy'));
assert_equal('PHP And Perl', decamelize('PHPAndPerl'));
assert_equal('UNIX And Linux Are Different', decamelize('UNIXAndLinuxAreDifferent'));
assert_equal('Mac OS', decamelize('MacOS'));

assert_equal('simple', strip_extension('simple.txt'));
assert_equal('with spaces', strip_extension('with spaces.txt'));
assert_equal('CamelCase', strip_extension('CamelCase.txt'));
assert_equal('with_numbers', strip_extension('with_numbers.mp3'));
assert_equal('with_two', strip_extension('with_two.out.txt'));
assert_equal('with two and spaces', strip_extension('with two and spaces.out.txt'));
assert_equal('with_long', strip_extension('with_long.sparseImage'));

assert_equal('Spaced Out', humanize('Spaced Out.txt'));
assert_equal('Underscored Name', humanize('Underscored_Name.txt'));
assert_equal('Camel Case', humanize('CamelCase.txt'));
assert_equal('Lowercase', humanize('lowercase.txt'));
assert_equal('Tech Services', humanize('Tech Services'));
assert_equal('Summer Opening Events', humanize('SummerOpeningEvents.docx'));
assert_equal('Coordinators Sept 8', humanize('CoordinatorsSept8.txt'));
assert_equal('Coords Minutes-old', humanize('CoordsMinutes-old.txt'));

