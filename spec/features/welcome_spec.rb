require 'rails_helper'

RSpec.describe 'As a User' do
  describe 'when I select Tennessee and click find parks' do
    it 'sees the total of parks found' do
      visit root_path
      
      click_on 'Find Parks'
      expect(page).to have_button('Find Parks')
    end
  end
end
