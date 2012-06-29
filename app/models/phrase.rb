# == Schema Information
#
# Table name: phrases
#
#  id         :integer          not null, primary key
#  key        :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Phrase < ActiveRecord::Base
  attr_accessible :key

  validates :key, :uniqueness => :true

  has_many :translations
  belongs_to :locale

end
