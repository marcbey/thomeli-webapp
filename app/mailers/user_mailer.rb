class UserMailer < ActionMailer::Base
  default from: I18n.t( :photo_email_sender )

  def send_photo( email, asset )
    attachments[asset.photo_name] = asset.photo.data

    mail to: email, subject: t( :photo_email_subject ).html_safe
  end
end

