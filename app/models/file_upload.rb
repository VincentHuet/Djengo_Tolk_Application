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

class FileUpload < ActiveRecord::Base
  attr_accessible :name, :path
end
