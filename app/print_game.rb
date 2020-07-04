# frozen_string_literal: true

# This class prints shots and score.
class PrintGame
  def initialize(frames)
    @frames = frames
  end

  def print_game
    print_shoots
    print_score
  end

  def print_shoots
    @frames.map { |frame| print "#{frame.first_shoot}|#{frame.second_shoot} " }
    print "\n"
  end

  def print_score
    total_score = 0
    10.times do |position|
      total_score += @frames[position].score
      print " #{total_score} "
    end
    print "\n"
  end
end
