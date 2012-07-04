class TranslatorMailer < ActionMailer::Base

  default :from => "eifion@asciicasts.com"

  def registration_confirmation(translator)
    mail(:to => translator.email, :subject => "Registered", :from => "eifion@asciicasts.com")
  end
end
