#!/usr/bin/ruby
require 'rubygems'
require 'net/smtp'
require 'mailfactory'
# MailFactory actually implements the builder pattern rather than the factory pattern
MailBuilder = MailFactory

mail = MailBuilder.new
mail.to = 'Asdf <asdf@asdf.com>'
mail.from = 'Ben Oakes <hello@benjaminoakes.com>'
mail.subject = 'My Subject'
mail.attach_as('/Users/ben/Outbox/my_file.txt', 'my_file.txt', 'text/plain')
mail.html = <<EOF
<p>
Here's the file you requested.
</p>

<p>
-- Ben
</p>
EOF

# puts mail.construct

# Make sure Postfix is running!  This will fail otherwise.
Net::SMTP.start('localhost') do |smtp|
  smtp.send_message mail.construct, mail.from, mail.to
end

