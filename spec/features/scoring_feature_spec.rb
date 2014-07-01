require 'spec_helper'

describe 'Scoring>' do

	context 'First frame>' do

		it 'can take in number of pins knocked down' do
			visit ('/')
			expect(page).to_not have_content('6')
			within('.frame_one') do
				page.fill_in('#roll_one', with: '3')
				page.fill_in('#roll_two', with: '5')
				page.click_on('Next')
			end
			expect(page).to have_content('6')
		end

		it 'throws an error when wrong format is entered and doesn´t change total score' do
			visit('/')
			within('.frame_one') do
				fill_in('#roll_one', with: '15')
				click_on('Next')
			end
			expect(page).to have_content('You can´t knock down more than ten pins in a roll')
			expect(page).to_not have_content('15')
			expect(page).to have_content('Wrong format!')
		end

		it 'displays an / if frame was a spare' do
			visit('/')
			within('.frame_one') do
				fill_in('#roll_one', with: '5')
				fill_in('#roll_two', with: '5')
				click_on('Next')
			end
			expect(page).to_not have_content('You can´t knock down more than ten pins in a roll')
			expect(page).to have_content('10')
			expect(page).to have_content('/')
		end

		it 'only displays an X and an empty field when your first roll is a strike' do
			visit('/')
			within('.frame_one') do
				fill_in('roll_one', with: '10')
				click_on('Next')
			end
			expect(page).to_not have_content('You can´t knock down more than ten pins in a roll')
			expect(page).to have_content('10')
			expect(page).to_not have_content('/')
		end
	end

	context 'Second Frame>' do

		it 'displays 15 if first frame was a spare and roll one in second frame was 5' do
			visit('/')
			within('.frame_one') do
				fill_in('roll_one', with: '5')
				puts "filled in worked"
				fill_in('roll_two', with: '5')
				puts "filled in works"
				click_on('Next')
			end
			expect(page).to_not have_content('You can´t knock down more than ten pins in a roll')
			expect(page).to have_content('10')
			expect(page).to have_content('/')
			within('.frame_two') do
				fill_in('roll_one', with:  '5')
				click_on('Next')
			end
			expect(page).to_not have_content('You can´t knock down more than ten pins in a roll')
			expect(page).to have_content('5')
			expect(page).to have_content('15')
		end

	end
end