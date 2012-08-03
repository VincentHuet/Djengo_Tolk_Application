class PhraseDatabaseFillerController < ApplicationController

  def show
    @yml_source = YmlSource.find(params[:id])

    @counter = YmlLoader.load_yaml_source(@yml_source)
  end

  def index
  	YmlSource.find_each do |yml_source|
  		@counter = YmlLoader.load_yaml_source(yml_source)
  	end
  end

end


