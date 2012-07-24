class TranslationsInLineController < ApplicationController

  def index
    puts("-----------------------------")
    puts(params)
    @locale = current_translator.locale
    if @locale
      @translations = @locale.translations
    else
      @translations = Translation.all
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
