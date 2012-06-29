# == Schema Information
#
# Table name: locales
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Locale < ActiveRecord::Base
  attr_accessible :name

  has_many :phrases
  has_many :translations
end
