# frozen_string_literal: true

require_relative('frame')
# This class captures, validates and displays errors of the data entered by the user
class GameData
  def initialize(frames, errors)
    @frames = frames
    @errors = errors
  end

  def promp_for_data
    first_shoot = capture_data('First shoot: ')
    second_shoot = 0
    second_shoot = capture_data('Second shoot: ') if first_shoot < 10
    validate_data(first_shoot, second_shoot)
  end

  def capture_data(message)
    print message
    shoot = gets.to_i
    shoot
  end

  def create_frame(first_shoot, second_shoot)
    frame = Frame.new(first_shoot, second_shoot)
    @frames << frame
    frame.calculate_score_bonus(@frames.reverse.take(2)) if @frames.size >= 2
  end

  def handle_errors
    puts 'Error en los datos'
    @errors = false
    promp_for_data
  end

  def validate_data(first_shoot, second_shoot)
    @errors = true if (first_shoot || second_shoot).negative? || (first_shoot || second_shoot) > 10
    @errors = true if (first_shoot + second_shoot) > 10
    @errors ? handle_errors : create_frame(first_shoot, second_shoot)
  end
end
