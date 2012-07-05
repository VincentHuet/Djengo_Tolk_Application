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

require 'test_helper'

class TranslationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
