module LocalesHelper

  def primary(locale)
    locale.primary_locale ? "primary" : "secondary"
  end


end
