class Locale < ActiveRecord::Base
  attr_accessible :name

  has_many :phrases
  has_many :translations
end
