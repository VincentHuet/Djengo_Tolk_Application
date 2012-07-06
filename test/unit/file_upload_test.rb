# == Schema Information
#
# Table name: file_uploads
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  path       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class FileUploadTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
