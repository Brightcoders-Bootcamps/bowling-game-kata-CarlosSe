# frozen_string_literal: true

# This class creates a new frame and calculate score with bonus
class Bonus
  def initialize(second_frame, first_frame, current_frame)
    @first_frame = first_frame
    @second_frame = second_frame
    @current_frame = current_frame
  end

  def calculate
    shoot = @first_frame.first_shoot
    if shoot == 10 && @second_frame.first_shoot == 10
      bonus_strikes
    elsif shoot == 10
      bonus_strike
    elsif @first_frame.score == 10
      bonus_spare
    end
  end

  def bonus_strikes
    @first_frame.score += @second_frame.score + @current_frame.first_shoot
  end

  def bonus_strike
    @first_frame.score += @second_frame.score
  end

  def bonus_spare
    @first_frame.score += @second_frame.first_shoot
  end
end
