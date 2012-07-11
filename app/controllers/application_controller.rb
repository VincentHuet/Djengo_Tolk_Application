class ApplicationController < ActionController::Base
  protect_from_forgery

  def current_ability
    @current_ability ||= Ability.new(current_translator)
  end

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Access denied."
    redirect_to root_url
  end

  protected
  def standard_respond_to(class_type)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: class_type }
    end
  end

  def destroy_respond_to
    respond_to do |format|
      format.html { redirect_to locales_url }
      format.json { head :no_content }
    end
  end

end
