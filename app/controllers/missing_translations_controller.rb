class MissingTranslationsController < ApplicationController

  def index
    @missing_translations = current_translator.locale.translations.translation_needed
  end


end
