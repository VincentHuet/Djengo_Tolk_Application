require 'yaml'

module BlogHelper

   def parse_yaml(h, indent)

    return_phrase = ""

    indent = indent + "--------"

    h.each_key do |key2|
      if h[key2].class == Hash
        # return_phrase << '<br />'
        return_phrase << indent + "<br />"
        return_phrase << indent + "| " + key2 << '<br />'
        return_phrase << parse_yaml(h[key2], indent)
      else
        return_phrase << indent << "[" + key2 + "] "        
        return_phrase << h[key2].to_s
        # return_phrase <<" est de type = > " +  h[key2].class.to_s
        return_phrase << '<br />'
      end
    end

    return_phrase.to_s
  end

  def read_dir
    file_list = ""

    @yml_list = {}

    @files = Dir.glob('config/locales/**/*.yml')
      for file in @files
          key = file
          # .split(/\//).reverse[0..2].reverse.to_sentence( :words_connector => '/',
          #                                                           :two_words_connector => '/',
          #                                                           :last_word_connector => '/').to_s
          file_list << key + "<br />" 

          # file_list << file + "<br />"

          yml_file_path = "#{Rails.root}/" + key

          puts YAML::load(File.open(yml_file_path)).inspect

          @yml_list[key] = YAML::load(File.open(yml_file_path))


          puts @yml_list.inspect
      end
    file_list
  end

end