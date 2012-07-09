# == Schema Information
#
# Table name: translations
#
#  id            :integer          not null, primary key
#  text          :string(255)
#  translator_id :integer
#  phrase_id     :integer
#  locale_id     :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  needed_update :integer
#

class Translation < ActiveRecord::Base
  attr_accessible :locale_id, :phrase_id, :previous_text, :text, :needed_update

  belongs_to :locale
  belongs_to :phrase
  belongs_to :translator

  before_save :needed_update_flag_update




  def need_updated?(current_translator)
    self.needed_update == 1 && current_translator.locale_id == self.locale_id || Locale.find(self.locale_id).is_primary? && Locale.find(current_translator.locale_id).is_primary? 
  end


  def needed_update_flag_update
    self.needed_update = 0

    if text.blank?
      self.needed_update = 1
    end

    if Locale.find(locale_id).is_primary?
      vincent = Translator.find(2)
      
      
      Locale.find_each do |locale|
        if !locale.is_primary?
          locale.translations.where(:phrase_id => self.phrase_id).update_all(:needed_update => 1)
          translator = Translator.find_by_locale_id(locale.id)
          TranslatorMailer.welcome_email(translator).deliver
        end
      end
      # phrase.translations.where("name != ?", :en).update_all(:needed_update => 1)
    end
  end


end
