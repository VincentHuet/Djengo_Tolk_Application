class TranslationsInLineController < ApplicationController

  def index
    puts("-----------------------------")
    puts(params)
    @locale = current_translator.locale
    if @locale
      @translations = @locale.translations.translation_needed
    else
      @translations = Translation.all
    end
    primary_locale = Locale.primary_locale
    @first_locale_translations = primary_locale.translations

    @corresponding_phrase = {}
    @translations.each do |translation|
      relevant_phrase = @first_locale_translations.where(:phrase_id => translation.phrase_id)
      relevant_phrase_text = relevant_phrase.first.text
      @corresponding_phrase[translation.id] = relevant_phrase_text
    end

  end

  def edit
    @translations = Translation.find([:params])
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
