class TranslationsController < ApplicationController
  # GET /translations
  # GET /translations.json

  before_filter :authenticate_translator!

  def index
    @locale = Locale.find(params[:locale_id])
    @translations = @locale.translations.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @translations }
    end
  end

  # GET /translations/1
  # GET /translations/1.json
  def show
    @translation = Translation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @translation }
    end
  end

  # GET /translations/new
  # GET /translations/new.json
  def new
    @corresponding_phrase = Phrase.find(params[:phrase_id])
    @translation = Translation.new(params[:translation])
    @translation.phrase_id = @corresponding_phrase.id

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @translation }
    end
  end

  # GET /translations/1/edit
  def edit
    @translation = Translation.find(params[:id])
  end

  # POST /translations
  # POST /translations.json
  def create
    @corresponding_phrase = Phrase.find(params[:phrase_id])
    @translation = Translation.new(params[:translation])
    @translation.phrase_id = @corresponding_phrase.id
    @translation.author = current_translator.id
    @translation.locale_id = current_translator.locale_id
    @translation.needed_update = 1


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
    @translation = Translation.find(params[:id])
    @translation.author = current_translator.id
    @translation.locale_id = current_translator.locale_id
    @translation.needed_update = 0

    if @translation.locale_id == 1
      Translation.where("id >= 2").update_all(:needed_update => 0)
    end
    
    respond_to do |format|
      if @translation.update_attributes(params[:translation])
        format.html { redirect_to @translation, notice: 'Translation was successfully updated.' }
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
    @translation = Translation.find(params[:id])
    @translation.destroy

    respond_to do |format|
      format.html { redirect_to translations_url }
      format.json { head :no_content }
    end
  end

  def index_by_locale
    @translations = Translation.where(:locale_id => params[:id])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @translations }
    end
  end


end
