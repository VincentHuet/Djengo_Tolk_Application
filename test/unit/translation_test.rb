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

require 'test_helper'

class TranslationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
