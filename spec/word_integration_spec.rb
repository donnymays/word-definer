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
end