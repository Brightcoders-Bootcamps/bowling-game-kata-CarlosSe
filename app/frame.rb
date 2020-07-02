# frozen_string_literal: true

require_relative('bonus')
# This class creates a new frame and calculate score with bonus
class Frame
  attr_accessor :score
  attr_reader :first_shoot, :second_shoot

  def initialize(first_shoot, second_shoot)
    @first_shoot = first_shoot
    @second_shoot = second_shoot
    @score = first_shoot + second_shoot
  end

  def calculate_score_bonus(penultimate_frame, last_frame)
    bonus = Bonus.new(penultimate_frame, last_frame, self)
    bonus.calculate
  end
end
