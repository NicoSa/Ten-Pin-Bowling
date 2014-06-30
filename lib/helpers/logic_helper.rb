module LogicHelper

	def correct_format?
		if (@roll_one.to_i && @roll_two.to_i) <= 10
			true
		else
			flash[:notice] = "You can´t knock down more than ten pins in a roll"
		end
	end

end