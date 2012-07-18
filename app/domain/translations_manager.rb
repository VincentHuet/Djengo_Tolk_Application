class TranslationsManager

	def self.insert(hash, path, value)
    head, *tail = path
    if tail.empty?
      hash.merge(head => value)
    else
      h = self.insert(hash[head] || {}, tail, value)
      hash.merge(head => hash.has_key?(head) ? hash[head].merge(h) : h)
    end
  end

  def self.create_translation_hash(translations)
    yml_hash = {}
    hash_locale_translation = {}

    translations.each do |translation|
      translation_phrase = translation.phrase
      yaml_path = translation_phrase.yaml_path
      translation_value = translation.text
      translation_value = "" if translation_value.blank?
      yml_hash = self.insert(yml_hash, yaml_path.sub(/[.]{2}/, "").split("."), translation_value)
    end
    yml_hash
  end

  def self.hash_to_export(locale_translation_hash, indent, space_type, return_type)
    return_phrase = ""
    locale_translation_hash.each_key do |locale_sub_level_key|
      if locale_translation_hash[locale_sub_level_key].class == Hash
        return_phrase << indent + locale_sub_level_key + ": " << return_type
        return_phrase << self.hash_to_export(locale_translation_hash[locale_sub_level_key], indent + space_type*2, space_type, return_type)
      else
        return_phrase << self.add_key_and_value(locale_translation_hash, indent, return_type, locale_sub_level_key)
      end
    end
    return_phrase.to_s
  end

  def self.add_key_and_value(locale_translation_hash, indent, return_type, locale_sub_level_key)
    return_phrase = ""
    if !locale_translation_hash[locale_sub_level_key].to_s.blank?
      return_phrase << indent << locale_sub_level_key + ": \" " + locale_translation_hash[locale_sub_level_key].to_s + "\"" + return_type
    else
      return_phrase << indent << locale_sub_level_key + ": " + "\" \"" + return_type
    end
  end

end