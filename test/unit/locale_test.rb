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

require 'test_helper'

class LocaleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
