
class BlogController < ApplicationController
  protect_from_forgery

  require 'yaml'

  def index
    if translator_signed_in?
    	@missing_translation = missing_translation?(current_translator.locale)
      @ratio = ratio(@missing_translation)
    end
  end

  def ratio(missing_translation)
    primary_keyword_quantity = phrase_quantity
    ratio = (missing_translation * 100) / primary_keyword_quantity
    ratio = 100 - ratio
    ratio
  end

end
