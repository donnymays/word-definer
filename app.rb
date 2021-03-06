require('pry')
require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require('./lib/definition')
also_reload('lib/**/*.rb')

require('pry')
also_reload('lib/**/*.rb')

get('/') do 
  @words = Word.all
  @definitions = Definition.all
  erb(:words)
end

get('/words') do
  @words = Word.all
  @definitions = Definition.all
  erb(:words)
end

post('/words') do
  name = params[:word_name].capitalize
  word = Word.new({:name => name, :id => nil})
  word.save()
  @words = Word.all
  erb(:words)
end

patch('/words') do
  @words = Word.sort
  erb(:words)
end

get('/words/new') do
  erb(:new_word)
end

get('/words/:id') do
  @word = Word.find(params[:id].to_i)
  erb(:word)
end

get('/words/:id/edit') do
  @word = Word.find(params[:id].to_i)
  erb(:word_edit)
end

patch('/words/:id') do
  @word = Word.find(params[:id].to_i)
  @word.update(params[:name].capitalize)
  @words = Word.all
  erb(:words)
end

delete('/words/:id') do
  @word = Word.find(params[:id].to_i)
  @word.delete()
  @words = Word.all
  erb(:words)
end

get('/words/:id/definition/:definition_id') do
  @definition = Definition.find(params[:definition_id].to_i())
  erb(:definition)
end

post('/words/:id/definition') do
  @word = Word.find(params[:id].to_i())
  definition = Definition.new({:name => params[:definition_name], :word_id => @word.id, :id => nil})
  definition.save()
  erb(:word)
end

patch('/words/:id/definitions/:definition_id') do
  @word = Word.find(params[:id].to_i())
  definition = Definition.find(params[:definition_id].to_i())
  definition.update(params[:name], @word.id)
  erb(:word)
end

delete('/words/:id/definitions/:definition_id') do
  definition = Definition.find(params[:definition_id].to_i())
  definition.delete
  @word = Word.find(params[:id].to_i())
  erb(:word)
end