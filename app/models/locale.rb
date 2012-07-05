# == Schema Information
#
# Table name: locales
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  primary_locale :boolean
#

class Locale < ActiveRecord::Base
  attr_accessible :name, :id, :primary_locale

  has_many :phrases
  has_many :translations
end
