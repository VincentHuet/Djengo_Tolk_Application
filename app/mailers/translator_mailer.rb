class TranslatorMailer < ActionMailer::Base

  default :from => "eifion@asciicasts.com"

  def welcome_email(translator)
    @translator = translator
    @url  = "http://example.com/login"
    mail(:to => translator.email, :subject => "Welcome to My Awesome Site")
  end
end
