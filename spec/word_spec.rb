require 'rspec'
require 'word'

describe '#Word' do
  
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

end