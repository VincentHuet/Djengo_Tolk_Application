# == Schema Information
#
# Table name: translations
#
#  id            :integer          not null, primary key
#  text          :string(255)
#  author        :integer
#  phrase_id     :integer
#  locale_id     :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  needed_update :integer
#

class Translation < ActiveRecord::Base
  attr_accessible :locale_id, :phrase_id, :previous_text, :text, :needed_update

  belongs_to :locale
  belongs_to :phrase
end
