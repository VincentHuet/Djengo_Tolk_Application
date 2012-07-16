class CustomDevise::RegistrationsController < Devise::RegistrationsController

  def new
    @locales = Locale.all
    super
  end
end