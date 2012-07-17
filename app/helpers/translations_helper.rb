module TranslationsHelper

  def hash_to_export(locale_translation_hash, indent, space_type, return_type)
    return_phrase = ""
    locale_translation_hash.each_key do |locale_sub_level_key|
      if locale_translation_hash[locale_sub_level_key].class == Hash
        return_phrase << indent + locale_sub_level_key + ": " << return_type
        indent = indent + space_type*2
        return_phrase << hash_to_export(locale_translation_hash[locale_sub_level_key], indent, space_type, return_type)
      else
        return_phrase << add_key_and_value(locale_translation_hash, indent, return_type, locale_sub_level_key)
        # return_phrase << locale_translation_hash[locale_sub_level_key].to_s
        # return_phrase << return_type
      end
    end
    return_phrase.to_s
  end

  def add_key_and_value(locale_translation_hash, indent, return_type, locale_sub_level_key)
    return_phrase = ""
    if !locale_translation_hash[locale_sub_level_key].to_s.blank?
      return_phrase << indent << locale_sub_level_key + ": \" " + locale_translation_hash[locale_sub_level_key].to_s + "\"" + return_type
    else
      return_phrase << indent << locale_sub_level_key + ": " + "\" \"" + return_type
    end
  end

end
