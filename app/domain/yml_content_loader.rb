class YmlContentLoader

  def self.load_locales13213
    self.load_pathes.each do |file|
      new_yml_source = YmlSource.new
      new_yml_source.name = file.from(15).truncate(2, :separator => '.')
      new_yml_source.path = file
      new_yml_source.save if YmlSource.find_by_path(file).nil?
    end
  end
end