require 'rspec'
require 'definition'
require 'word'
require 'pry'

describe '#Definition' do

  before(:each) do
    Word.clear()
    Definition.clear()
    @word = Word.new({:name => "green", :id => nil, :description => nil})
    @word.save()
  end

  describe('#==') do
    it("is the same definition if it has the same attributes as another definition") do
      definition = Definition.new({:name => "blue", :id => nil, :word_id => @word.id})
      definition2 = Definition.new({:name => "blue", :id => nil, :word_id => @word.id})
      expect(definition).to(eq(definition2))
    end
  end

  describe('.all') do
    it("returns a list of all definitions") do
      definition = Definition.new({:name => "green", :id => nil, :word_id => @word.id})
      definition.save()
      definition2 = Definition.new({:name => "blue", :id => nil, :word_id => @word.id})
      definition2.save()
      expect(Definition.all).to(eq([definition, definition2]))
    end
  end

  describe('.clear') do
    it("clears all definitions") do
      definition = Definition.new({:name => "green", :id => nil, :word_id => @word.id})
      definition.save()
      definition2 = Definition.new({:name => "blue", :id => nil, :word_id => @word.id})
      definition2.save()
      Definition.clear()
      expect(Definition.all).to(eq([]))
    end
  end

  describe('#save') do
    it("saves a definition") do
      definition = Definition.new({:name => "blue", :id => nil, :word_id => @word.id})
      definition.save()
      expect(Definition.all).to(eq([definition]))
    end
  end

  describe('.find') do
    it("finds a definition by id") do
      definition = Definition.new({:name => "green", :id => nil, :word_id => @word.id})
      definition.save()
      definition2 = Definition.new({:name => "blue", :id => nil, :word_id => @word.id})
      definition2.save()
      expect(Definition.find(definition.id)).to(eq(definition))
    end
  end

  describe('#update') do
    it("updates a definition by id") do
      definition = Definition.new({:name => "blue", :id => nil, :word_id => @word.id})
      definition.save()
      definition.update("green", :body => nil)
      expect(definition.name).to(eq("green"))
    end
  end

  describe('#delete') do
    it("deletes a definition by id") do
      definition = Definition.new({:name => "green", :id => nil, :word_id => @word.id})
      definition.save()
      definition2 = Definition.new({:name => "blue", :id => nil, :word_id => @word.id})
      definition2.save()
      definition.delete()
      expect(Definition.all).to(eq([definition2]))
    end
  end

  describe('.find_by_word') do
    it("finds definitions for a word") do
      word2 = Word.new({:name => "blue", :id => nil, :description => nil, })
      word2.save
      definition = Definition.new({:name => "yellow", :id => nil, :word_id => @word.id})
      definition.save()
      definition2 = Definition.new({:name => "green", :id => nil, :word_id => word2.id})
      definition2.save()
      expect(Definition.find_by_word(word2.id)).to(eq([definition2]))
    end
  end

  describe('#word') do
    it("finds the word a definition belongs to") do
      definition = Definition.new({:name => "blue", :id => nil, :word_id => @word.id})
      definition.save()
      expect(definition.word()).to(eq(@word))
    end
  end
end