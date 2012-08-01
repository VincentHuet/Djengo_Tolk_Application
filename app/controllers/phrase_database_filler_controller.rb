class PhraseDatabaseFillerController < ApplicationController

  def show
    @yml_source = YmlSource.find(params[:id])
    @Yml_to_hash = YmlLoader.load_yaml(@yml_source.path)
    indent = "--"
    @counter = YmlLoader.parse_yaml_to_db(@Yml_to_hash, '', indent)
  end

end


