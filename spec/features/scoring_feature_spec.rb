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

		it 'throws an error when wrong format is entered and doesn´t change total score' do
			visit('/')
			within('.frame_one') do
				fill_in('roll_one', with => 15)
				click_on('Next')
				expect(page).to have_content('You can´t knock down more than ten pins in a roll')
				expect(page).to_not have_content('15')
				expect(page).to have_content('Wrong format!')
			end
		end

		it 'only displays an X and an empty field when your first roll is a strike' do
			visit('/')
			within('.frame_one') do
				fill_in('roll_one', with => 10)
				click_on('Next')
				expect(page).to_not have_content('You can´t knock down more than ten pins in a roll')
				expect(page).to have_content('10')
				expect(page).to_not have_content('/')
			end
		end
	end

	# context 'Second Frame>' do

	# 	it ''
end