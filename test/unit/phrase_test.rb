# == Schema Information
#
# Table name: phrases
#
#  id         :integer          not null, primary key
#  key        :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  yaml_path  :string(255)
#  en_value   :string(255)
#

require 'test_helper'

class PhraseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
