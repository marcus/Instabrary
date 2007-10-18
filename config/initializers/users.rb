ActionMailer::Base.smtp_settings = {
  :address => "mail.instabrary.com",
  :port => 25, #587
  :domain => "instabrary.com",
  :authentication => :login,
  :user_name => "activation@instabrary.com",
  :password => "act11vation"
}
ActionMailer::Base.delivery_method = :smtp