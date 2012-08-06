module TranslatorsHelper

  def locale_list(locales)
    locales.collect {|l| [ l.name, l.id ] }
  end
end
