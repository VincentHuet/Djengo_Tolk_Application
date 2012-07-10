class YmlLoader
  def self.load_pathes
    Dir.glob('config/locales/**/*en.yml')
  end

  def self.load_locales
    self.load_pathes.each do |file|
      new_yml_source = YmlSource.new
      file_path = file.sub!(/config\/locales\//,"").to_s
      file_name = file.to_s
      new_yml_source.path = file_path
      new_yml_source.name = file_name.sub(/\/en.yml/,"").sub(/\./,"").sub(/[\/]/,"_")
      new_yml_source.save if YmlSource.find_by_path(file).nil?
    end
  end

  def self.load_yml_content
    yml_to_hash = ''
    self.load_pathes.each do |file|
      indent = "--"
      yml_to_hash = self.load_yaml(file)
      self.parse_yaml_to_db(yml_to_hash, '.', indent)
    end
  end

   def self.load_yaml(path)
    yml_to_hash = ''
    yml_file_path = "#{Rails.root}/config/locales/" + path
    yml_to_hash = YAML::load(File.open(yml_file_path))
    yml_to_hash
  end

  def self.parse_yaml_to_db(hash_branch, hash_path, indent)
    return_phrase = ""
    counter = 0
    hash_branch.each_key do |sub_tree_key|
      if hash_branch[sub_tree_key].kind_of? Hash
        hash_path << "." + sub_tree_key.to_s
        counter += parse_yaml_to_db(hash_branch[sub_tree_key], hash_path, indent)
      else
        new_phrase = Phrase.new
        new_phrase.yaml_path = hash_path + "." + sub_tree_key.to_s
        new_phrase.key = sub_tree_key.to_s

        if Phrase.find_by_yaml_path(new_phrase.yaml_path).nil?
          new_phrase.save 
          counter += 1
          new_translation = Translation.new
          new_translation.text = hash_branch[sub_tree_key].to_s
          new_translation.translator_id = Translator.where(:name => 'DB_loader').first.id
          new_translation.phrase_id = new_phrase.id
          
          en_local = Locale.primary_locale
          new_translation.locale_id = en_local.id
          new_translation.needed_update = 0
          new_translation.save if en_local.translations.find_by_phrase_id(new_translation.phrase_id).nil?
          
          Locale.find_each do |locale|
            if !locale.is_primary?
              new_translation = Translation.new
              new_translation.text = nil
              new_translation.translator = Translator.db_loader
              new_translation.phrase_id = new_phrase.id
              new_translation.locale_id = locale.id
              new_translation.save if locale.translations.find_by_phrase_id(new_translation.phrase_id).nil?
            end
          end

          return_phrase << "[" + hash_path + "." + sub_tree_key.to_s + "] "        
          return_phrase << hash_branch[sub_tree_key].to_s
          # return_phrase <<" est de type = > " +  hash_branch[sub_tree_key].class.to_s
          return_phrase << '<br />'
        end
      end
    end
    counter
  end

end