require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe '#Definition' do
  before(:each) do
    Word.clear()
    Definition.clear()
  end

  describe('create a definition for a word', {:type => :feature}) do
    it('creates a definition for a word') do
      visit('/words')
      click_on('Add a new word')
      fill_in('word_name', :with => 'hexagon')
      click_on('Make a new word')
      click_on('hexagon')
      fill_in('definition_name', :with => '6 sided polygon')
      click_on('Add definition')
      expect(page).to have_content('polygon')
    end
  end
end