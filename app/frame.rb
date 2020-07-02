# frozen_string_literal: true

# This class creates a new frame and calculate score with bonus
class Frame
  attr_accessor :score
  attr_reader :first_shoot, :second_shoot

  def initialize(first_shoot, second_shoot)
    @first_shoot = first_shoot
    @second_shoot = second_shoot
    @score = first_shoot + second_shoot
  end

  def calculate_score_bonus(previous_frames)
    last_frame = previous_frames[0]
    penultimate_frame = previous_frames[1]
    if penultimate_frame.first_shoot == 10 && last_frame.first_shoot == 10
      penultimate_frame.score += last_frame.score + @first_shoot
    elsif penultimate_frame.first_shoot == 10
      penultimate_frame.score += last_frame.score
    elsif penultimate_frame.score == 10
      penultimate_frame.score += last_frame.first_shoot
    end
  end
end
