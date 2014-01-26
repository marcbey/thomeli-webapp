class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.send_photo.subject
  #
  def send_photo( email, token )
    photo_manager = PhotoManager.photo_with_token( token )

    attachments[photo_manager.photo_name] = photo_manager.photo

    mail to: email, subject: 'Ihr Bild vom Thomeli ist da :-)'
  end
end
