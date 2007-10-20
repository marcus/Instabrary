require 'lib/smtp_tls'

ActionMailer::Base.smtp_settings = {
  :address => "smtp.gmail.com",
  :port => "587",
  :domain => "instabrary.com",
  :authentication => :plain,
  :user_name => "activation@instabrary.com",
  :password => "act11vation"
}
ActionMailer::Base.delivery_method = :smtp