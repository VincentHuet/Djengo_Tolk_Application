require 'yaml'

module YmlSourcesHelper

  def print_yaml_file(h, hash_path, indent)

    return_phrase = ""

    indent = indent + "--"

    h.each_key do |key2|
      if h[key2].class == Hash
        # return_phrase << '<br />'
        hash_path << "/" + key2.to_s
        return_phrase << indent + "| <br />"
        return_phrase << indent + "| " + key2 << '<br />'

        hash_path << "/" + key2.to_s

        return_phrase << parse_yaml(h[key2], hash_path, indent)
      else
        return_phrase << indent << "[" + key2.to_s + "] "        
        return_phrase << h[key2].to_s
        # return_phrase <<" est de type = > " +  h[key2].class.to_s
        return_phrase << '<br />'
      end
    end

    return_phrase.to_s
  end

  def parse_yaml(h, hash_path, indent)

    return_phrase = ""

    h.each_key do |key2|
      if h[key2].class == Hash
        # return_phrase << '<br />'
        # return_phrase << indent + "| <br />"
        # return_phrase << indent + "| " + key2 << '<br />'
        hash_path << "." + key2.to_s
        parse_yaml(h[key2], hash_path, indent)
      else

        new_phrase = Phrase.new

        new_phrase.yaml_path = hash_path + "." + key2.to_s
        new_phrase.key = key2.to_s

        new_phrase.save!



        new_translation = Translation.new

        new_translation.text = h[key2].to_s
        new_translation.translator_id = Translator.where(:name => 'DB_loader').first.id
        new_translation.phrase_id = new_phrase.id
        new_translation.locale_id = Locale.where(:name => :en).first.id
        new_translation.needed_update = 0
        new_translation.save!

        @locales = Locale.where("name != ?", :en)

        @locales.each do |locale|
          new_translation = Translation.new

          new_translation.text = "---"
          new_translation.translator_id = Translator.where(:name => 'DB_loader').first.id
          new_translation.phrase_id = new_phrase.id
          new_translation.locale_id = locale.id
          new_translation.needed_update = 1

          new_translation.save!
        end

        return_phrase << "[" + hash_path + "." + key2.to_s + "] "        
        return_phrase << h[key2].to_s
        # return_phrase <<" est de type = > " +  h[key2].class.to_s
        return_phrase << '<br />'
      end
    end
  end



  def load_yaml(path)

    yml_file_path = "#{Rails.root}/" + path

    @Yml_to_hash = YAML::load(File.open(yml_file_path))

  end
end
