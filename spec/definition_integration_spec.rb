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

  describe('create a path for a specific definition', {:type => :feature}) do
    it('displays a page for a specific definition') do
      visit('/words')
      click_on('Add a new word')
      fill_in('word_name', :with => 'hexagon')
      click_on('Make a new word')
      click_on('hexagon')
      fill_in('definition_name', :with => '6 sided polygon')
      click_on('Add definition')
      click_on('6 sided polygon')
      expect(page).to have_content('Delete definition')
    end
  end

  describe('update a definition', {:type => :feature}) do
    it('updates a definition') do
      visit('/words')
      click_on('Add a new word')
      fill_in('word_name', :with => 'hexagon')
      click_on('Make a new word')
      click_on('hexagon')
      fill_in('definition_name', :with => '6 sided polygon')
      click_on('Add definition')
      click_on('6 sided polygon')
      fill_in('name', :with => 'six sided polygon')
      click_on('Update definition')
      expect(page).to have_content('six')
    end
  end

  describe('delete a definition', {:type => :feature}) do
    it('deletes a definition') do
      visit('/words')
      click_on('Add a new word')
      fill_in('word_name', :with => 'hexagon')
      click_on('Make a new word')
      click_on('hexagon')
      fill_in('definition_name', :with => '6 sided polygon')
      click_on('Add definition')
      click_on('6 sided polygon')
      click_on('Delete definition')
      expect(page).to have_content('There are no definitions listed')
    end
  end


end