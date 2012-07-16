
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

    create_respond_to(@phrase)
  end

  # PUT /phrases/1
  # PUT /phrases/1.json
  def update
    update_respond_to(@phrase, params[:phrase])
  end

  # DELETE /phrases/1
  # DELETE /phrases/1.json
  def destroy
    @phrase.destroy

    destroy_respond_to
  end

end
