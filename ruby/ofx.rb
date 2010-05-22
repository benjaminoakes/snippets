# Author: Benjamin Oakes <hello@benjaminoakes.com>
require 'rubygems'
require 'ofx-parser'

ofx = OfxParser::OfxParser.parse(open(ARGV[0]))

# puts ofx.bank_account.number
ofx.bank_account.statement.transactions.each do |transaction|
  puts transaction.payee
  puts transaction.type
  puts transaction.amount
end

