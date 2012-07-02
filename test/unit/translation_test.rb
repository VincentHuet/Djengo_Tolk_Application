# == Schema Information
#
# Table name: translations
#
#  id              :integer          not null, primary key
#  Primary_updated :boolean
#  text            :string(255)
#  previous_text   :string(255)
#  phrase_id       :integer
#  locale_id       :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'test_helper'

class TranslationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
