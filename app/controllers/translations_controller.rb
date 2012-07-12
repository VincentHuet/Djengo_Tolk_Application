class TranslationsController < ApplicationController
  # GET /translations
  # GET /translations.json
  before_filter :authenticate_translator!
  load_and_authorize_resource

  def index
    if !Locale.find(params[:locale_id]).nil?
      @locale = Locale.find(params[:locale_id])
      @translations = @locale.translations.all
    else
      @translations = Translation.all
    end
    
    standard_respond_to(@translations)
  end

  # GET /translations/1
  # GET /translations/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @translation }
    end
  end

  # GET /translations/new
  # GET /translations/new.json
  def new
    @corresponding_phrase = Phrase.find(params[:phrase_id])
    @translation = @corresponding_phrase.translations.build(params[:translation])
    @translation.phrase_id = @corresponding_phrase.id

    standard_respond_to(@translation)
  end

  # GET /translations/1/edit
  def edit
  end

  # POST /translations
  # POST /translations.json
  def create
    @corresponding_phrase = Phrase.find(params[:phrase_id])
    @translation = @corresponding_phrase.translations.build(params[:translation])
    @translation = add_current_translator_information(@translation)

    create_respond_to(@translation)
  end

  # PUT /translations/1
  # PUT /translations/1.json
  def update
    @translation.translator_id = current_translator.id
    @translation.locale_id = current_translator.locale_id
    
    update_respond_to(@translation, params[:translation], translations_path(Locale.find(@translation.locale_id)))
  end

  # DELETE /translations/1
  # DELETE /translations/1.json
  def destroy
    @translation.destroy

    destroy_respond_to
  end

  def add_current_translator_information(translation)
    translation.author = current_translator.id
    translation.locale_id = current_translator.locale_id
  end

end
