require 'rspec'
require 'word'

describe '#Word' do
  
  before(:each) do
    Word.clear()
  end

  describe(".all") do
    it("is empty at first") do   
      expect(Word.all()).to(eq([]))
    end
  end 

  describe('#save') do
    it("saves a word") do
      word1 = Word.new({:name => "blue", :id => nil})
      word1.save()
      word2 = Word.new({:name => "green", :id => nil})
      word2.save()
      expect(Word.all).to(eq([word1, word2]))
    end
  end

  describe('.clear') do
    it('clears all the words') do
    word1 = Word.new({:name => "blue", :id => nil})
    word1.save()
    word2 = Word.new({:name => "green", :id => nil})
    word2.save()
    Word.clear()
    expect(Word.all).to(eq([]))
    end
  end

  describe('.find') do
    it('finds specific word from its ID') do
      word1 = Word.new({:name => "blue", :id => nil})
      word1.save()
      expect(Word.find(word1.id)).to(eq(word1))
    end
  end

  describe('#delete') do
    it("deletes a word by id") do
      word1 = Word.new({:name => "blue", :id => nil})
      word1.save()
      word2 = Word.new({:name => "green", :id => nil})
      word2.save()
      word1.delete()
      expect(Word.all).to(eq([word2]))
    end
  end

  describe('#update') do
    it("updates a word's name") do
      word1 = Word.new({:name => "blue", :id => nil})
      word1.save()
      word1.update("green")
      expect(word1.name).to(eq("green"))
    end
  end

end