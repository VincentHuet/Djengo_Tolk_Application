class TranslationsController < ApplicationController
  # GET /translations
  # GET /translations.json
  before_filter :authenticate_translator!
  load_and_authorize_resource

  def index
    @locale = Locale.find_by_id(params[:locale_id])
    if @locale
      @translations = @locale.translations
    else
      @translations = Translation.all
    end

    @yml_hash = TranslationsManager.create_translation_hash(@translations)

    standard_respond_to(@translations)
  end

  # GET /translations/1
  # GET /translations/1.json
  def show
    @relevant_locale = @translation.locale
    @relevant_locale_name = @relevant_locale.name

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
    @translation.needed_update_flag_update

    next_translation_path = next_path(@translation)

    update_respond_to(@translation, params[:translation], next_translation_path)
  end

  # DELETE /translations/1
  # DELETE /translations/1.json
  def destroy
    @translation.destroy

    destroy_respond_to
  end

  private
  def add_current_translator_information(translation)
    translation.author = current_translator.id
    translation.locale_id = current_translator.locale_id
  end

  def next_path(current_translation)
    locale = current_translator.locale
    @locale_translations = locale.translations
    @locale_translations_needed = @locale_translations.where(:needed_update => 1)
    @locale_translations_needed = @locale_translations_needed.where("id != ?", current_translation.id )
    @next_translation = @locale_translations_needed.first

    if @next_translation.nil?
      locale_translations_path(@translation.locale)
    else
      edit_translation_path(@next_translation)
    end
  end

end
