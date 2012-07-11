
class PhrasesController < ApplicationController
  # GET /phrases
  # GET /phrases.json

  before_filter :authenticate_translator!
  load_and_authorize_resource

  def index
    @phrases = Phrase.all
    standard_respond_to(@phrase)
  end

  # GET /phrases/1
  # GET /phrases/1.json
  def show
    standard_respond_to(@phrase)
  end

  # GET /phrases/new
  # GET /phrases/new.json
  def new
    @phrase = Phrase.new
    standard_respond_to(@phrase)
  end

  # GET /phrases/1/edit
  def edit
  end

  # POST /phrases
  # POST /phrases.json
  def create
    @phrase = Phrase.new(params[:phrase])

    respond_to do |format|
      if @phrase.save
        TranslatorMailer.deliver_bienvenue
        format.html { redirect_to @phrase, notice: 'Phrase was successfully created.' }
        format.json { render json: @phrase, status: :created, location: @phrase }
      else
        format.html { render action: "new" }
        format.json { render json: @phrase.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /phrases/1
  # PUT /phrases/1.json
  def update
    respond_to do |format|
      if @phrase.update_attributes(params[:phrase])
        format.html { redirect_to @phrase, notice: 'Phrase was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @phrase.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /phrases/1
  # DELETE /phrases/1.json
  def destroy
    @phrase.destroy

    destroy_respond_to
  end

  private
  def get_phrase(phrase_id)
    Phrase.find(phrase_id)
  end
end
