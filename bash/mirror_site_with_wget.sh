# Author: Benjamin Oakes <hello@benjaminoakes.com>

site_url="$1"
wget -e robots=off --wait 1 -m -k -K -E "$site_url"

