class YmlLoader
  def self.load_pathes
    Dir.glob('config/locales/**/*en.yml')
  end

  def self.load_locales
    self.load_pathes.each do |file|
      new_yml_source = YmlSource.new
      new_yml_source.name = file.from(15).truncate(2, :separator => '.')
      new_yml_source.path = file
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
    
    yml_file_path = "#{Rails.root}/" + path

    yml_to_hash = YAML::load(File.open(yml_file_path))

    yml_to_hash
  end

  def self.parse_yaml_to_db(h, hash_path, indent)

    return_phrase = ""
    counter = 0


    h.each_key do |key2|
      if h[key2].class == Hash
        # return_phrase << '<br />'
        # return_phrase << indent + "| <br />"
        # return_phrase << indent + "| " + key2 << '<br />'
        hash_path << "." + key2.to_s
        counter += parse_yaml_to_db(h[key2], hash_path, indent)
      else

        new_phrase = Phrase.new

        new_phrase.yaml_path = hash_path + "." + key2.to_s
        new_phrase.key = key2.to_s

        puts "=="*20
        puts Phrase.find_by_yaml_path(new_phrase.yaml_path).inspect

        if Phrase.find_by_yaml_path(new_phrase.yaml_path).nil?
          new_phrase.save 
          counter += 1
        
          new_translation = Translation.new
          new_translation.text = h[key2].to_s
          new_translation.translator_id = Translator.where(:name => 'DB_loader').first.id
          new_translation.phrase_id = new_phrase.id
          en_local = Locale.find_by_name(:en)
          new_translation.locale_id = en_local.id
          new_translation.needed_update = 0
          new_translation.save if en_local.translations.find_by_phrase_id(new_translation.phrase_id).nil?

          @locales = Locale.where("name != ?", :en)

          @locales.each do |locale|
            new_translation = Translation.new
            new_translation.text = nil
            new_translation.translator_id = Translator.where(:name => 'DB_loader').first.id
            new_translation.phrase_id = new_phrase.id
            new_translation.locale_id = locale.id
            new_translation.needed_update = 1
            new_translation.save if locale.translations.find_by_phrase_id(new_translation.phrase_id).nil?
          end

          return_phrase << "[" + hash_path + "." + key2.to_s + "] "        
          return_phrase << h[key2].to_s
          # return_phrase <<" est de type = > " +  h[key2].class.to_s
          return_phrase << '<br />'
        end
      end
    end

    counter
  end

end