# IMAP access to Gmail.
# 
# Author: Benjamin Oakes <hello@benjaminoakes.com>
require 'net/imap'

USERNAME = 'YOU@gmail.com'
PASSWORD = 'YOUR_PASSWORD'

class EmailMessage
  attr_reader :from, :subject, :body

  def initialize(from, subject, body)
    @from = from
    @subject = subject
    @body = body
  end
end

class IMAPAccount
  def initialize(server, port, using_ssl, &block)
    @imap = Net::IMAP.new('imap.gmail.com', '993', true)
    @imap.login(USERNAME, PASSWORD)

    yield self

    @imap.logout
  end

  def messages_from(folder)
    messages = []

    @imap.select(folder)
    @imap.search(["NOT", "DELETED"]).each do |message_id|
      envelope = @imap.fetch(message_id, "ENVELOPE")[0].attr["ENVELOPE"]
      body = @imap.fetch(message_id, "BODY[TEXT]")[0].attr["BODY[TEXT]"]

      messages << EmailMessage.new(
        "#{envelope.from[0].name} <#{envelope.from[0].mailbox}@#{envelope.from[0].host}>",
        "#{envelope.subject}",
        body
      )
    end

    return messages
  end
end

IMAPAccount.new('imap.gmail.com', '993', true) do |imap_account|
  messages = imap_account.messages_from('INBOX')

  messages.each do |message|
    puts "From: #{message.from}"
    puts "Subject: #{message.subject}"
    puts

    puts message.body
    puts
  end
end

