require 'yaml'

module YmlSourcesHelper

  def parse_yaml(h, hash_path, indent)

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

  def load_yaml(path)

    yml_file_path = "#{Rails.root}/" + path

    @Yml_to_hash = YAML::load(File.open(yml_file_path))

  end
end
