# Jello Server

This Rails --API application is something like Trello, providing RESTful APIs for client.

## Requirement

  * `ruby 2.2 or higher`
  * `rails 5.0 or higher`


## Design

#### Models and associations

![model](https://drive.google.com/uc?id=0Byxeja4jYwq4M01YNERFYTJpVnM)
1. User
  ```ruby
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


## Usage

Clone & Bundle and you are ready to use the Jello service!

#### API Endpoints