class Translation < ActiveRecord::Base
  attr_accessible :Primary_updated, :locale, :locale_id, :phrase, :phrase_id, :previous_text, :text

  belongs_to :locale
  belongs_to :phrase
end
