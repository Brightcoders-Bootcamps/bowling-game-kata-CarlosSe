# frozen_string_literal: true

require_relative('frame')
require_relative('errors')
# This class captures, validates and displays errors of the data entered by the user
class GameData
  def promp_for_data(frames)
    first_shoot = capture_data('First shoot: ')
    second_shoot = 0
    second_shoot = capture_data('Second shoot: ') if first_shoot < 10
    check_for_errors(frames, first_shoot, second_shoot)
  end

  def capture_data(message)
    print message
    shoot = gets.to_i
    shoot
  end

  def check_for_errors(frames, first_shoot, second_shoot)
    errors = Errors.new.validate_data(first_shoot, second_shoot)
    errors == false ? create_frame(frames, first_shoot, second_shoot) : promp_for_data(frames)
  end

  def create_frame(frames, first_shoot, second_shoot)
    frame = Frame.new(first_shoot, second_shoot)
    frames << frame
    previous_frames = frames.reverse.take(2)
    frame.calculate_score_bonus(previous_frames[0], previous_frames[1]) if frames.size >= 2
  end
end
