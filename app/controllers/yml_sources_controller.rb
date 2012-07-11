require 'yml_sources_helper'

class YmlSourcesController < ApplicationController
  # GET /yml_sources
  # GET /yml_sources.json

  before_filter :authenticate_translator!
  load_and_authorize_resource

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

    respond_to do |format|
      if @yml_source.save
        format.html { redirect_to @yml_source, notice: 'Yml source was successfully created.' }
        format.json { render json: @yml_source, status: :created, location: @yml_source }
      else
        format.html { render action: "new" }
        format.json { render json: @yml_source.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /yml_sources/1
  # PUT /yml_sources/1.json
  def update
    respond_to do |format|
      if @yml_source.update_attributes(params[:yml_source])
        format.html { redirect_to @yml_source, notice: 'Yml source was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @yml_source.errors, status: :unprocessable_entity }
      end
    end
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


