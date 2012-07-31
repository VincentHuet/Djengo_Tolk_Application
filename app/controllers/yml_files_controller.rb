class YmlFilesController < ActionController::Base

	def index
		@locale = Locale.find_by_id(params[:locale_id])
    if @locale
      @translations = @locale.translations
    else
      @translations = Translation.all
    end
    @yml_hash = {}
    @translation_hash = TranslationsManager.create_translation_hash(@translations)
    @yml_hash = TranslationsManager.hash_to_export(@translation_hash, "", " ", "\n")
    if !@yml_hash.blank?
      YmlLoader.export_hash_to_yaml_locale(@yml_hash, @locale)
    end
    respond_to do |format|
   		if !request.env["HTTP_REFERER"].blank?
   			format.html { redirect_to :back }
   		else
   			format.html { redirect_to root_path }
   		end
		end
	end
end
