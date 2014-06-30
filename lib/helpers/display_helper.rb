module DisplayHelper

	def display_score_for_frame
		if rolls_present 
			'Click next!'
		elsif correct_format?
			calculate_score_for_frame
		else
			'Wrong format!'
		end
	end

	def spare?(score)
		if (calculate_score_for_frame == 10) && (@roll_two.to_i != 0)
			'/'
		elsif (calculate_score_for_frame == 10) && (@roll_two.to_i == 0)
			''
		else
			score
		end	
	end

	def strike?(score)
		if score == 10
			'X'
		else
		 	score
		end
	end

	def display_roll(roll)
		unless roll
			'Roll'
		else
			roll.to_i
		end
	end

	def rolls_present
		!@roll_one && !@roll_two 
	end

	def calculate_score_for_frame
		@roll_one.to_i + @roll_two.to_i
	end
end