require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe '#Word' do

  before(:each) do
    Word.clear()
  end

  describe('create an intial path', {:type => :feature}) do
    it('creates a landing page') do
      visit('/')
      expect(page).to have_content('Word')
    end
  end

  describe('create a /words path', {:type => :feature}) do
    it('creates a landing page') do
      visit('/words')
      expect(page).to have_content('Word')
    end
  end

  describe('create a word path', {:type => :feature}) do
    it('creates a word and then goes to the word page') do
      visit('/words')
      click_on('Add a new word')
      expect(page).to have_content("Make a new word") 
    end
  end

  describe('form successfully submits to add a new word', {:type => :feature}) do
    it('creates a new word on the /words page') do
      visit('/words')
      click_on('Add a new word')
      fill_in('word_name', :with => 'hexagon')
      click_on('Make a new word')
      expect(page).to have_content('Hexagon') 
    end
  end

  describe('creates a word/id path', {:type => :feature}) do
    it('creates a new view when an individual word is clicked on') do
      visit('/words')
      click_on('Add a new word')
      fill_in('word_name', :with => 'hexagon')
      click_on('Make a new word')
      click_on('Hexagon')
      expect(page).to have_content('Word Name:')
    end
  end

  describe('creates a word edit path', {:type => :feature}) do
    it('creates a new view when edit word is clicked on') do
      visit('/words')
      click_on('Add a new word')
      fill_in('word_name', :with => 'polygon')
      click_on('Make a new word')
      click_on('Polygon')
      click_on('Edit word')
      expect(page).to have_content('Rename word')
    end
  end

  describe('creates a word edit path', {:type => :feature}) do
    it('creates a new view when edit word is clicked on') do
      visit('/words')
      click_on('Add a new word')
      fill_in('word_name', :with => 'hexagon')
      click_on('Make a new word')
      click_on('Hexagon')
      click_on('Edit word')
      fill_in('name', :with => 'polygon')
      click_on('Update')
      expect(page).to have_content('Polygon')
    end
  end
  
  describe('deletes a word', {:type => :feature}) do
    it('deletes a word') do
      visit('/words')
      click_on('Add a new word')
      fill_in('word_name', :with => 'hexagon')
      click_on('Make a new word')
      click_on('Hexagon')
      click_on('Edit word')
      click_on('Delete word')
      expect(page).to have_content('There are currently no words to display')
    end
  end

  describe('sort words', {:type => :feature}) do
    it('sorts words alphabetically') do
      visit('/words')
      click_on('Add a new word')
      fill_in('word_name', :with => 'hexagon')
      click_on('Make a new word')
      click_on('Add a new word')
      fill_in('word_name', :with => 'bagel')
      click_on('Make a new word')
      click_on('Sort Words Alphabetically')
      expect(page).to have_content('Bagel Hexagon')
    end
  end
end