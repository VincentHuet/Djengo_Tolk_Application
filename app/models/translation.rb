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
    self.needed_update == 1 && self.locale_id == current_translator.locale_id
  end

  private
    def needed_update_flag_update
      needed_update = 0

      if text.blank?
        needed_update = 1
      end

      if locale_id == 1
        # bientot corrigé
        # phrase.translations.where("name != ?", :en).update_all(:needed_update => 1)
      end
    end


end
