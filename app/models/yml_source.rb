class YmlSource < ActiveRecord::Base
  attr_accessible :name; :yml_file


  mount_uploader :yml_file, YmlFileUploader
end
