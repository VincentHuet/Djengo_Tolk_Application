module LocalesHelper

  def primary?(locale)
    if locale.primary_locale == true
      @return = "primary"
    else
      @return = "secondary"
    end
    @return
  end

  def missing_translation?(locale)
    (Translation.where(:locale_id => 1).count - Translation.where(:locale_id => locale.id).where(:needed_update => 0).count)
  end


end
