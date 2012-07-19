class TranslationsInLineController < ApplicationController

  def index
    @locale = current_translator.locale
    if @locale
      @translations = @locale.translations
    else
      @translations = Translation.all
    end

  end

  def edit
    @translations = Translation.all
  end

  def update
    Translation.update(params[:translations].keys, params[:translations].values)
    flash[:notice] = "Translations updated"
    redirect_to root_path
  end

end
