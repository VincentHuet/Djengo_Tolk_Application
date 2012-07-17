
class YmlSourcesController < ApplicationController
  # GET /yml_sources
  # GET /yml_sources.json

  before_filter :authenticate_translator!
  #load_and_authorize_resource

  def index
    @yml_files = YmlLoader.load_pathes
    YmlLoader.load_locales
    @yml_sources = YmlSource.all   # YmlLoader.load_yml_content

    standard_respond_to(@yml_sources)
  end

  # GET /yml_sources/1
  # GET /yml_sources/1.json
  def show
    standard_respond_to(@yml_source)
  end

  # GET /yml_sources/new
  # GET /yml_sources/new.json
  def new
    @yml_source = YmlSource.new

    standard_respond_to(@yml_source)
  end

  # GET /yml_sources/1/edit
  def edit
  end

  # POST /yml_sources
  # POST /yml_sources.json
  def create
    @yml_source = YmlSource.new(params[:yml_source])
    create_respond_to(@yml_source)
  end

  # PUT /yml_sources/1
  # PUT /yml_sources/1.json
  def update
    update_respond_to(@yml_source, params[:yml_source])
  end

  # DELETE /yml_sources/1
  # DELETE /yml_sources/1.json
  def destroy
    @yml_source.destroy
    destroy_respond_to
  end

  def load_to_db
    @yml_source = YmlSource.find(params[:id])
    @Yml_to_hash = YmlLoader.load_yaml(@yml_source.path)
  end

end


