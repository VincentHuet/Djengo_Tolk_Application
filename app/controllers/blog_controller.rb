
class BlogController < ApplicationController
  protect_from_forgery

  require 'yaml'

  def index
    yaml_article_path = "#{Rails.root}/config/locales/" + "views/articles/en.yml"
    @information = YAML::load(File.open(yaml_article_path)) 
  end

 

end
