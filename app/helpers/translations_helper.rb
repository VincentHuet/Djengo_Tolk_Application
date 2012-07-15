module TranslationsHelper
  
  def parse_exported_hash_to_html(h, indent)
    return_phrase = ""
    indent = indent + "&nbsp;"*2
    h.each_key do |key2|
      if h[key2].class == Hash
        return_phrase << indent + key2 + ": " << '<br />'
        return_phrase << parse_exported_hash_to_html(h[key2], indent)
      else
        return_phrase << indent << key2 + ": "
        return_phrase << h[key2].to_s
        # return_phrase <<" est de type = > " + h[key2].class.to_s
        return_phrase << '<br />'
      end
    end
    return_phrase.to_s
  end

  def parse_exported_hash_to_yml(h, indent)
    return_phrase = ""
    h.each_key do |key2|
      if h[key2].class == Hash
        return_phrase << indent + key2 + ": " << "\n"
        indent = indent + " "*2
        return_phrase << parse_exported_hash_to_yml(h[key2], indent)
      else
        return_phrase << indent << key2 + ": "
        return_phrase << h[key2].to_s
        # return_phrase <<" est de type = > " + h[key2].class.to_s
        return_phrase << "\n"
      end
    end
    return_phrase.to_s
  end

end
