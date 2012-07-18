class YmlFilesController < ActionController::Base

	def index

		@locale = Locale.find_by_id(params[:locale_id])
    if @locale
      @translations = @locale.translations
    else
      @translations = Translation.all
    end

    @yml_hash = TranslationsManager.create_translation_hash(@translations)

    YmlLoader.export_hash_to_yaml_locale(TranslationsManager.hash_to_export(@yml_hash, "", " ", "\n"), @locale)

    respond_to do |format|
   		if !request.env["HTTP_REFERER"].blank?
   			format.html { redirect_to :back }
   		else
   			format.html { redirect_to root_path }
   		end
		end
	end
end
