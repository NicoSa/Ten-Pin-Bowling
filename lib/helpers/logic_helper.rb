module LogicHelper

	def correct_format?
		if less_than_ten_pins_knocked_down && correct_frame_score
			return true
		else
			flash[:notice] = "You can´t knock down more than ten pins in a roll"
			return false
		end
	end

	def less_than_ten_pins_knocked_down
		(@roll_one.to_i <= 10) && (@roll_two.to_i <= 10)
	end

	def correct_frame_score
		calculate_score_for_frame <= 10
	end


end