# frozen_string_literal: true

class FilmMailer < ApplicationMailer
  def film_added(recipient_email)
    @film = params[:film]

    mail to: recipient_email, subject: I18n.t('mailers.film_mailer.film_added.subject')
  end
end
