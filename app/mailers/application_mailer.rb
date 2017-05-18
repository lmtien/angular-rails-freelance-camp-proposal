class ApplicationMailer < ActionMailer::Base
  default from: 'mailerbot@gmail.com'
  layout 'mailer'
end
