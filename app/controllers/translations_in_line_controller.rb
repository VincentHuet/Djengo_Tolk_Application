class TranslationsInLineController < ApplicationController

  def index
    if current_translator.locale.is_primary?
      @locale = Locale.find(params[:locale_id])
    else
      @locale = current_translator.locale
    end

    if @locale && current_translator.locale.is_primary?
      @translations = @locale.translations.translation_needed
    else
      @translations = Translation.all
    end

    primary_locale = Locale.primary_locale

    @first_locale_translations = primary_locale.translations

    @corresponding_phrase = create_phrase_translation_table(@translations)
  end

  def edit
    @translations = Translation.find([:params])
    @corresponding_phrase = create_phrase_translation_table(@translations)
  end

  def update
    Translation.update(params[:translations].keys, params[:translations].values)
    flash[:notice] = "Translations updated"
    redirect_to root_path
  end

  def create
    @corresponding_translation = Translation.find(params[:translation_id])

    create_respond_to(@corresponding_translation)
  end

end
