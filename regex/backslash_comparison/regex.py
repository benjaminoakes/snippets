# Author: Benjamin Oakes <hello@benjaminoakes.com>

import re

pattern = re.compile('cookies\\\\blah')
print pattern.match('cookies\\blah')
