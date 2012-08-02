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

    hash_branch.inject(0) do |counter, sub_tree_key|

      if hash_branch[sub_tree_key.first].kind_of? Hash
        counter + parse_yaml_to_db(hash_branch[sub_tree_key.first], hash_path + "." + sub_tree_key.first.to_s, indent)
      else
        counter + new_phrase_entry(hash_path, sub_tree_key.first, hash_branch)
      end
    end
  end

  def self.new_phrase_entry(hash_path, sub_tree_key, hash_branch)
    new_phrase = Phrase.new
    new_phrase.yaml_path = hash_path + "." + sub_tree_key.first.to_s
    new_phrase.key = sub_tree_key.first.to_s
    counter = self.populate_phrase_table(hash_branch, sub_tree_key, new_phrase)
  end

  def self.populate_phrase_table(hash_branch, sub_tree_key, new_phrase)
    counter = 0
    if Phrase.find_by_yaml_path(new_phrase.yaml_path).nil?
      if !new_phrase.blank?
        new_phrase.save
        counter = 1
        populate_translation_table(hash_branch, sub_tree_key, new_phrase)
      end
    else
      update_phrase = Phrase.find_by_yaml_path(new_phrase.yaml_path)
      primary_locale_for_translation = Locale.primary_locale

      update_translations = update_phrase.translations

      primary_update_translation = update_translations.where(:locale_id => primary_locale_for_translation.id)

      if primary_update_translation.first.text != hash_branch[sub_tree_key].to_s
        puts "=================================================".inspect
        puts primary_update_translation.first.text.inspect
        puts "=================================================".inspect
        puts hash_branch[sub_tree_key].to_s.inspect
        puts "=================================================".inspect

        Translation.update(primary_update_translation.first.id, :text => hash_branch[sub_tree_key].to_s)
        counter = 1
      end
      puts "=================================================".inspect
      puts primary_update_translation.first.inspect
      puts "=================================================".inspect
    end
    counter
  end

  def self.populate_translation_table(hash_branch, sub_tree_key, relevant_phrase)
    new_translation = Translation.new
    new_translation.text = hash_branch[sub_tree_key].to_s
    new_translation.phrase_id = relevant_phrase.id
    en_local = Locale.primary_locale
    new_translation.locale_id = en_local.id
    new_translation.needed_update_flag_update
    new_translation.save if en_local.translations.find_by_phrase_id(new_translation.phrase_id).nil?

    populate_non_primary_translation_table(relevant_phrase)
  end

  def self.populate_non_primary_translation_table(relevant_phrase)
    Locale.find_each do |locale|
      if !locale.is_primary?
        new_translation = Translation.new
        new_translation.phrase_id = relevant_phrase.id
        new_translation.locale_id = locale.id
        new_translation.needed_update_flag_update
        new_translation.save if locale.translations.find_by_phrase_id(new_translation.phrase_id).nil?
      end
    end
  end

  def self.export_hash_to_yaml_locale(yaml_exported_file, locale)
    if File.exist?("#{Rails.root}/config/locales/#{locale.name}.yml")
      File.rename("#{Rails.root}/config/locales/#{locale.name}.yml", "#{Rails.root}/config/locales/#{locale.name}.yml.old")
    end
    File.open("#{Rails.root}/config/locales/#{locale.name}.yml", 'w') do |file|
      file.write yaml_exported_file
    end
  end

  def exist_file?(yaml_file_paht)
    File.exist()
  end
end