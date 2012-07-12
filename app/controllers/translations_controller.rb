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
    @translation.phrase_id = @corresponding_phrase.id
    @translation.author = current_translator.id
    @translation.locale_id = current_translator.locale_id


    respond_to do |format|
      if @translation.save
        format.html { redirect_to @translation, notice: 'Translation was successfully created.' }
        format.json { render json: @translation, status: :created, location: @translation }
      else
        format.html { render action: "new" }
        format.json { render json: @translation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /translations/1
  # PUT /translations/1.json
  def update
    @translation.translator_id = current_translator.id
    @translation.locale_id = current_translator.locale_id
    
    
    respond_to do |format|
      if @translation.update_attributes(params[:translation])
        format.html { redirect_to locale_translations_path(Locale.find(@translation.locale_id)), notice: 'Translation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @translation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /translations/1
  # DELETE /translations/1.json
  def destroy
    @translation.destroy

    destroy_respond_to
  end

end
