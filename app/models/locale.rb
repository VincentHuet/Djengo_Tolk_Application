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
  has_many :translators

  #validates :primary_locale, presence => true

  def self.primary_locale
    Locale.find_by_primary_locale(true)
  end

  def is_primary?
    primary_locale
  end
end
