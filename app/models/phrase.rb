class Phrase < ActiveRecord::Base
  attr_accessible :key

  validates :key, :uniqueness => :true

  has_many :translations
  belongs_to :locale

end
