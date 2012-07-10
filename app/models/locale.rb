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



  def primary_locale
    Locale.find_by_name(:en)
  end

  def secondary_locale
    Locale.where("name != ?", :en)
  end

  def is_primary?
    prim_loc = sprimary_locale
    self.id == prim_loc.id
  end
end
