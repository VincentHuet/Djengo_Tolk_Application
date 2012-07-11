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

  def need_updated?
    self.needed_update == 1 
  end

  def needed_update_flag_update
    self.needed_update = 0

    if text.blank?
      self.needed_update = 1
    end

    if Locale.find(locale_id).is_primary?
      actualize_secondary_locale_relevant_translation
    end
  end

  def actualize_secondary_locale_relevant_translation
    Locale.find_each do |locale|
      if !locale.is_primary?
        locale.translations.where(:phrase_id => self.phrase_id).update_all(:needed_update => 1)
        translator = Translator.find_by_locale_id(locale.id)
        mail_if_deliverable(translator)
      end
    end
  end

  def mail_if_deliverable(translator)
    TranslatorMailer.welcome_email(translator).deliver if !translator.nil?
  end

end
