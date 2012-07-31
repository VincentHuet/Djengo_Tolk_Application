class Ability
  include CanCan::Ability

  def initialize(translator)
    translator ||= Translator.new # guest translator

    can :read, :all

    can :update, Translation do |translation|
      translation.locale_id == translator.locale_id
    end

    can :create, Locale
    can :destroy, Locale

    can :create, :all
  end
end

