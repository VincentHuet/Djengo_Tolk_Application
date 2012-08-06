module FlashHelper
  def flash_class(flash_type)
    if flash_type == :notice
      'alert-block'
    else
      'alert-error'
    end
  end
end