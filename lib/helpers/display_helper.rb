module DisplayHelper

	def display_score_for_frame
		unless @roll_one && @roll_two 
			'Click next!'
		else
			@roll_one.to_i + @roll_two.to_i
		end
	end

	def display_roll_one
		unless @roll_one
			'Roll one'
		else
			@roll_one.to_i
		end
	end

	def display_roll_two
		unless @roll_two
			'Roll two'
		else
			@roll_two.to_i		
		end
	end
end