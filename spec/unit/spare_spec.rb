require 'spec_helper'

describe 'Spare and strikes' do

	context 'Spare' do

		it 'displays a / for a spare' do
			@roll_one = 7
			@roll_two = 3
			expect(spare?(@roll_two)).to eq '/'
		end


		it 'should not display / for roll two when roll one was a strike' do
			@roll_one = 10
			@roll_two = 0
			expect(spare?(@roll_two)).to eq ""
		end

	end

	context 'Strike' do

		it 'displays an X for a strike' do
			@roll_one = 10
			expect(strike?(@roll_one)).to eq 'X'
		end

	end

end