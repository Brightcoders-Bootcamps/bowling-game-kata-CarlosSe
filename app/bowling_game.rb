# frozen_string_literal: true

require_relative('game_data')
# This class validates the last frame, starts the game and prints it
class BowlingGame
  attr_reader :frames, :errors, :total_score

  def initialize
    @frames = []
    @errors = false
    @total_score = 0
  end

  def start
    data = GameData.new(@frames, @errors)
    data.promp_for_data while @frames.size < 10
    validate_last_frame
    print_game
  end

  def print_game
    @frames.map { |frame| print "#{frame.first_shoot}|#{frame.second_shoot} " }
    print "\n"
    10.times do |position|
      @total_score += @frames[position].score
      print " #{@total_score} "
    end
    print "\n"
  end

  def validate_last_frame
    data = GameData.new(@frames, @errors)
    data.promp_for_data if @frames.last.score == 10
  end
end

game = BowlingGame.new
game.start
