# == Schema Information
#
# Table name: translations
#
#  id         :integer          not null, primary key
#  text       :string(255)
#  author     :string(255)
#  phrase_id  :integer
#  locale_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Translation < ActiveRecord::Base
  attr_accessible :Primary_updated, :locale_id, :phrase_id, :previous_text, :text

  belongs_to :locale
  belongs_to :phrase
end
