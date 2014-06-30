require 'spec_helper'

describe 'Scoring>' do

	context 'First frame>' do

		it 'can take in number of pins knocked down' do
			visit ('/')
			expect(page).to_not have_content('6')
			within('.frame_one') do
				fill_in('roll_one', :with => 3)
				fill_in('roll_two', :with => 5)
				click_on('Next')
				expect(page).to have_content('6')
			end
		end

		it 'throws an error when wrong format is entered' do
			visit('/')
			within('.frame_one') do
				fill_in('roll_one', with => 15)
				click_on('Next')
			end
			expect(page).to have_content('You can´t knock down more than ten pins in a roll')
		end
	end
end