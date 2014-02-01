class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def send_photo( email, asset )
    attachments[asset.photo_name] = asset.photo.data

    mail to: email, subject: 'Ihr Bild vom Thomeli ist da :-)'
  end
end

