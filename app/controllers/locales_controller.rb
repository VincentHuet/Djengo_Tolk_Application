
class LocalesController < ApplicationController
  # GET /locales
  # GET /locales.json
  before_filter :authenticate_translator!
  load_and_authorize_resource
  def index
    @locales = Locale.all
    standard_respond_to(@locales)
  end

  # GET /locales/1
  # GET /locales/1.json
  def show
    standard_respond_to(@locale)
  end

  # GET /locales/new
  # GET /locales/new.json
  def new
    @locale = Locale.new
    standard_respond_to(@locale)
  end

  # GET /locales/1/edit
  def edit
  end

  # POST /locales
  # POST /locales.json
  def create
    @locale = Locale.new(params[:locale])

    create_respond_to(@locale)
  end

  # PUT /locales/1
  # PUT /locales/1.json
  def update
    @locale = Locale.find(params[:id])

    update_respond_to(@locale, params[:locale])
  end

  # DELETE /locales/1
  # DELETE /locales/1.json
  def destroy
    @locale = Locale.find(params[:id])
    @locale.destroy

    destroy_respond_to
  end
end
