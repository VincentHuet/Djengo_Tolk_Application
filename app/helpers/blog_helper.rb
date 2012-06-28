module BlogHelper

   def parse_yaml(h, indent)

    return_phrase = ""

    indent = indent + "----"

    h.each_key do |key2|
      if h[key2].class == Hash
        return_phrase << '<br />'
       return_phrase << indent + " | " + key2
        return_phrase << '<br />'
        return_phrase << parse_yaml(h[key2], indent)
      else
        return_phrase <<  indent << "[" + key2 + "] "        
        return_phrase << h[key2]
        # return_phrase <<" est de type = > " +  h[key2].class.to_s
        return_phrase << '<br />'
      end
    end

    return_phrase.to_s
  end

end