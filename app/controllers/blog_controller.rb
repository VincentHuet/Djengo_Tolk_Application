
class BlogController < ApplicationController
  protect_from_forgery

  require 'yaml'

  def index
    @information = YAML::load(File.open("#{Rails.root}/config/locales/views/articles/en.yml")) 
  end

 

end
