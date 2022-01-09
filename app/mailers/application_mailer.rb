class ApplicationMailer < ActionMailer::Base
  default from: %{"TestGuru" <test_guru@mail.com>}
  layout 'mailer'
end
