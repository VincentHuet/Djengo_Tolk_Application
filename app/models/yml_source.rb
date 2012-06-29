class YmlSource < ActiveRecord::Base
  attr_accessible :name; :yml_file


  mount_uploader :image, YmlFileUploader
end
