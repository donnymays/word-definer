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
      expect(page).to have_content('hexagon') 
    end
  end

  describe('creates a word/id path', {:type => :feature}) do
    it('creates a new view when an individual word is clicked on') do
      visit('/words')
      click_on('Add a new word')
      fill_in('word_name', :with => 'hexagon')
      click_on('Make a new word')
      click_on('hexagon')
      expect(page).to have_content('Word Name:')
    end
  end
end