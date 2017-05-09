class Card < ApplicationRecord
  belongs_to :list
  belongs_to :creator
  belongs_to :assignee
end
