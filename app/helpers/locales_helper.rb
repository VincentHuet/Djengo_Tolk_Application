module LocalesHelper

  def primary(locale)
    locale.primary_locale ? "primary" : "secondary"
  end

  def missing_translation?(locale)
    reference_locale = Locale.primary_locale
    primary_keyword_quantity = reference_locale.translations.count 
    current_done_translation = locale.translations.where(:needed_update => 0).count
    primary_keyword_quantity - current_done_translation
  end
end
