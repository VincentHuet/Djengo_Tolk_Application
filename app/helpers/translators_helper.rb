module TranslatorsHelper

  def locale_list
    Locale.all.collect {|l| [ l.name, l.id ] }
  end
end
