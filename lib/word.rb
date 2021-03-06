class Word
  attr_reader :name, :id

  @@words = {}
  @@total_rows = 0

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id) || @@total_rows += 1
  end

  def self.all
    @@words.values
  end

  def ==(word_to_compare)
    self.name == word_to_compare.name
  end  
  
  def save 
    @@words[id] = Word.new({:name => self.name, :id => self.id})
  end

  def self.clear
    @@words= {}
    @@total_rows = 0
  end
  
  def self.find(id)
    @@words[id]
  end

  def self.sort
    @words_sorted = @@words.values.sort_by {|word| word.name}
  end

  def delete
    @@words.delete(self.id)
  end

  def update(name)
    @name = name
  end

  def definitions
    Definition.find_by_word(self.id)
  end
end