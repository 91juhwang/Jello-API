# Jello Server

This application is a mock version of Trello API, where a client can use the provided RESTful APIs to generate lists.

## Requirement

  * `ruby 2.2 or higher`
  * `rails 5.0 or higher`
  * `rack-cors` for cross origin resource sharing (CORS)
  * `bcrypt` for authentication
  * `active_model_serializers` to turn it as a JSON Objects


## Design

#### Models and associations

![model](https://drive.google.com/uc?id=0Byxeja4jYwq4M01YNERFYTJpVnM)
* Removed auto-generated `foreign_key: true` in `rails g` and added `add_foreign_key` in the migrations file explicitly for the non-standard naming of creator_id, and assignee_id
1. User
  ```ruby
  # bcrypt authentication
  has_secure_password 

  # Nullify turns dependent foreign keys into null if the reference_key gets removed.
  has_many boards, foreign_key: 'creator_id', dependent: nullify 
  has_many lists, foreign_key: 'creator_id', dependent: nullify 
  has_many cards, foreign_key: 'creator_id', dependent: nullify
  has_many comments, foreign_key: 'creator_id', dependent: nullify
  ```
2. Board
  ```ruby
  belongs_to :creator, class_name: 'User'
  has_many :lists, dependent: :destroy
  ```
3. List
  ```ruby
  belongs_to :board
  belongs_to :creator, class_name: 'User'
  has_many :cards, dependent: :destroy
  ```
4. Card
  ```ruby
  # Optional true turns off the validation for the foreign_key
  belongs_to :list
  belongs_to :creator, class_name: 'User'
  belongs_to :assignee, class_name: 'User', optional: true
  has_many :comments, dependent: :destroy
  ```
5. Comment
  ```ruby
  belongs_to :card
  belongs_to :creator, class_name: 'User'
  ```
They all have basic validation in place such as email uniqueness & presence, title presence(board,list,cards) and body presence for the comments.
 
## Authentication

To be updated..

## Usage

Clone & Bundle and you are ready to use the Jello service!

#### API Endpoints

##### Users:

  * `GET '/users/:id'`

    - Returns the user information