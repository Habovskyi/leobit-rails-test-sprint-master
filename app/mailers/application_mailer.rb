# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  DEFAULT_FROM = 'no_reply@your_project_brand.com'

  layout 'mailer'

  default from: DEFAULT_FROM
end
