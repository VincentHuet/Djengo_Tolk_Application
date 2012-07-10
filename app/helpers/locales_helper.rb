module LocalesHelper

  def primary(locale)
    if locale.primary_locale
      "primary"
    else
      "secondary"
    end
  end

  def missing_translation?(locale)
    primary_locale = Locale.primary_locale
    (primary_locale.translations.count - locale.translations.where(:needed_update => 0).count)
  end


end
