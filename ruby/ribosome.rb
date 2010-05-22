# Taking a bio class at the time.  :)
# 
# Author: Benjamin Oakes <hello@benjaminoakes.com>

END_AMINO = '*'

mRNA = 'AUGCCCTAA' # ARGV[0]

protein = []
started = false
ended = false

mRNA.gsub(/.../) do |codon|
  if 'AUG' == codon
    started = true
    protein << 'M'
  elsif started
    protein << case codon
    when 'AAA'
      'K'
    when 'CCC'
      'P'
    when 'TAA'
      ended = true
      END_AMINO
    else
      'unknown'
    end
  end
end

if ended
  puts protein.join # MP*
end

