class TranslatorObserver < ActiveRecord::Observer
  def after_save(translator)
    TranslatorMailer.deliver_bienvenue
  end
end