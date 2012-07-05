module TranslationsHelper

  def needed_update?(translation_check)
    if translation_check.needed_update == 1 && translation_check.locale_id == current_translator.locale_id
      @return = true
    else
      @return = false
    end
    @return
  end


end
