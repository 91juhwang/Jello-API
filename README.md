# Jello Server

This Rails --API application is something like Trello, providing RESTful APIs for client.

## Requirements

  * `ruby 2.2 or higher`
  * `rails 5.0 or higher`

## Abstract

#### Model association & Behind scene design.

![model](https://drive.google.com/uc?id=0Byxeja4jYwq4M01YNERFYTJpVnM)
* User
  * has_many boards, foreign_key: 'creator_id'
  * has_many lists
  * has_many cards
  * has_many comments 


