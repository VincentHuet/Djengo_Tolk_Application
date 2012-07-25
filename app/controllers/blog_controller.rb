
class BlogController < ApplicationController
  protect_from_forgery

  require 'yaml'

  def index
    if translator_signed_in?
    	@missing_translation = missing_translation?(current_translator.locale)
      @ratio = ratio(@missing_translation)
    end
  end

	def missing_translation?(locale)
    primary_keyword_quantity = phrase_quantity
    current_done_translation = locale.translations.where(:needed_update => 0).count
    primary_keyword_quantity - current_done_translation
  end

  def phrase_quantity()
    reference_locale = Locale.primary_locale
    primary_keyword_quantity = reference_locale.translations.count
    primary_keyword_quantity
  end

  def ratio(missing_translation)
    primary_keyword_quantity = phrase_quantity
    ratio = (missing_translation * 100) / primary_keyword_quantity
    ratio = 100 - ratio
    ratio
  end

end
