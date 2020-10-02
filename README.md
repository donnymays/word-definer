# _Word Definer_

_2 October 2020_

#### _Application that will allow a user to create words with corresponding definitions_

#### By _**Donny Mays**_

## Setup/Installation Requirements
- In terminal/command line, navigate into the directory where you would like to create a new Ruby project.
- Clone this project using the 'git clone <filename>' command in terminal/command line while in the desired directory.
- Navigate to the cloned folder and run 'bundle' in your command line to download gem dependencies.
- Run 'ruby app.rb' in the terminal while still in the root directory of the new project. 
- Open a browser and type the localhost port that Sinatra gives in the terminal (ex:localhost:4567)

## Description
_This is a project for Week 2 of the Ruby block of Epicodus.  Prompt can be seen below._

_The original instructions for the assignment include:_
The Word Definer
Make an application that contains a Word class. The homepage of the app should list all words. When a word is clicked, it should lead to a page with the word's definitions. Children should be able to add a word, and when viewing a word, be able to add, update or delete one or more definitions. This week you should deploy your application to Heroku so the kids can try it out!

## Specifications for Words
| Verb     | Route | CRUD Action    | Description   |
| -------- | -------- | -------- | -------- |
| GET | /words | READ | Displays a list of words |
| GET | /words/:id | READ | Displays a page for a single word |
| POST | /words | CREATE | Adds a new word |
| PATCH | words/:id | UPDATE | Updates a single word |
| DELETE | words/:id | DELETE | Deletes a word from the list |

## Specifications for Definitions
| Verb     | Route | CRUD Action    | Description   |
| -------- | -------- | -------- | -------- |
| GET | /words/:id/definition | READ | Displays a list of definitions for a word |
| GET | /words/:id/definition/:definition_id | READ | Displays a page for a single definition |
| POST | /words/:id/definition | CREATE | Adds a new definition |
| PATCH | /words/:id/definitions/:definition_id | UPDATE | Updates a single definition |
| DELETE | /words/:id/definitions/:definition_id | DELETE | Deletes a definition from the list |


## Known Bugs
_There are no known bugs at this time_

## Technologies Used
* Ruby
* HTML
* Bootstap CSS framework
* Gems: rspec, pry, sinatra, capybara, heroku

### License
Copyright (c) 2020 **_Donny Mays_**

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.