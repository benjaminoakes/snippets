# Author: Benjamin Oakes <hello@benjaminoakes.com>

LATIN_SQUARE = [
  'JUMBLE',
  'BJLUEM',
  'LMJEBU',
  'UBEJML',
  'MEULJB',
  'ELBMUJ',
]

MAPPING = {
  'J' => 1,
  'U' => 2,
  'M' => 3,
  'B' => 4,
  'L' => 5,
  'E' => 6,
}

# MAPPING = {
#   'J' => 2,
#   'U' => 3,
#   'M' => 5,
#   'B' => 7,
#   'L' => 11,
#   'E' => 13,
# }

# LATIN_SQUARE = [
#   'UBEJML',
#   'BJLUEM',
#   'MEULJB',
#   'ELBMUJ',
#   'LMJEBU',
#   'JUMBLE',
# ]
# 
# MAPPING = {
#   'U' => 2,
#   'B' => 3,
#   'J' => 5,
#   'L' => 7,
#   'E' => 11,
#   'M' => 13,
# }

LATIN_SQUARE.each do |string|
  mapped = string.dup
  MAPPING.each do |letter, number|
    mapped.gsub!(letter, "#{number} ")
  end
  puts mapped + ";"
end

