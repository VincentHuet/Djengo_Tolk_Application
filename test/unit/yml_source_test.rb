# == Schema Information
#
# Table name: yml_sources
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  path       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class YmlSourceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
