require 'spec_helper'

describe 'Spare' do

	it 'displays a slash for a spare' do
		@roll_one = 7
		@roll_two = 3
		expect(spare?(@roll_two)).to eq '/'
	end

end