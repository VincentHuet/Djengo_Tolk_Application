module LocalesHelper

  def primary(locale)
    if locale.primary_locale == true
      return_status = "primary"
    else
      return_status = "secondary"
    end
    return_status
  end

  def missing_translation?(locale)
    primary_locale = Locale.where(:name => :en).first
    (primary_locale.translations.count - locale.translations.where(:needed_update => 0).count)
  end


end
