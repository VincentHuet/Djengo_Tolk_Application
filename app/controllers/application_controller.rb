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

  def create_respond_to(class_type)
    respond_to do |format|
      if class_type.save
        format.html { redirect_to class_type, notice: class_type.class.to_s + ' was successfully created.' }
        format.json { render json: class_type, status: :created, location: class_type }
      else
        format.html { render action: "new" }
        format.json { render json: class_type.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_respond_to(class_type, parameters, redirect_path = class_type)
    respond_to do |format|
      if class_type.update_attributes(parameters)
        format.html { redirect_to redirect_path, notice: class_type.class.to_s + ' was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: class_type.errors, status: :unprocessable_entity }
      end
    end
  end

end
