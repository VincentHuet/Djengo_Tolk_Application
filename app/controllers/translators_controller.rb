
class TranslatorsController < ApplicationController
  # GET /translators
  # GET /translators.json

  before_filter :authenticate_translator!
  load_and_authorize_resource

  def index
    @translators = Translator.all

    standard_respond_to(@translators)
  end

  # GET /translators/1
  # GET /translators/1.json
  def show
    standard_respond_to(@translator)
  end

  # GET /translators/new
  # GET /translators/new.json
  def new
    @translator = Translator.new

    standard_respond_to(@translator)
  end

  # GET /translators/1/edit
  def edit
  end

  # POST /translators
  # POST /translators.json
  def create
    @translator = Translator.new(params[:translator])

    create_respond_to(@translator)
  end

  # PUT /translators/1
  # PUT /translators/1.json
  def update
    update_respond_to(@translator, params[:translator])
  end

  # DELETE /translators/1
  # DELETE /translators/1.json
  def destroy
    @translator.destroy
    destroy_respond_to
  end
end
