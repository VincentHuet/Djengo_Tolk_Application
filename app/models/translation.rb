# == Schema Information
#
# Table name: translations
#
#  id              :integer          not null, primary key
#  Primary_updated :boolean
#  text            :string(255)
#  previous_text   :string(255)
#  phrase_id       :integer
#  phrase          :string(255)
#  locale_id       :integer
#  locale          :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Translation < ActiveRecord::Base
  attr_accessible :Primary_updated, :locale, :locale_id, :phrase, :phrase_id, :previous_text, :text

  belongs_to :locale
  belongs_to :phrase
end
