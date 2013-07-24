class Game < ActiveRecord::Base
  has_and_belongs_to_many :players
  # Remember to create a migration!
  belongs_to :winner, class_name: Player
end
