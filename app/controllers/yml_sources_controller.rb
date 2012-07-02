require 'yml_sources_helper'

class YmlSourcesController < ApplicationController
  # GET /yml_sources
  # GET /yml_sources.json
  def index
    @yml_sources = YmlSource.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @yml_sources }
    end
  end

  # GET /yml_sources/1
  # GET /yml_sources/1.json
  def show
    @yml_source = YmlSource.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @yml_source }
    end
  end

  # GET /yml_sources/new
  # GET /yml_sources/new.json
  def new
    @yml_source = YmlSource.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @yml_source }
    end
  end

  # GET /yml_sources/1/edit
  def edit
    @yml_source = YmlSource.find(params[:id])
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
    @yml_source = YmlSource.find(params[:id])

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
    @yml_source = YmlSource.find(params[:id])
    @yml_source.destroy

    respond_to do |format|
      format.html { redirect_to yml_sources_url }
      format.json { head :no_content }
    end
  end

def load_to_db
    @yml_source = YmlSource.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @yml_source }
    end
  end



end


