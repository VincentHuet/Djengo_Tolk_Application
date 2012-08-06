module BlogHelper

	def find_class_of_progess_bar(ratio)
		if @ratio <= 20
      'progress-danger'
  	elsif @ratio <= 50
      'progress-warning'
    elsif @ratio <= 95
      'progress-info'
    else
      'progress-success'
    end
	end

end