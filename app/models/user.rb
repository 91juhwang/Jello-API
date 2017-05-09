class User < ApplicationRecord
  include Gravatar

  has_many :boards, foreign_key: 'creator_id', dependent: :nullify
  has_many :lists, foreign_key: 'creator_id', dependent: :nullify
  has_many :cards, foreign_key: 'creator_id', dependent: :nullify
  has_many :comments, foreign_key: 'creator_id', dependent: :nullify
  has_many :assigned_cards, dependent: :nullify,
           class_name: 'Card', foreign_key: 'assignee_id'
end
