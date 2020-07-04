# frozen_string_literal: true

require_relative('game_data')
require_relative('print_game')
# This class validates the last frame, starts the game and prints it
class BowlingGame
  attr_reader :frames

  def initialize
    @frames = []
  end

  def start
    data = GameData.new
    printer = PrintGame.new(@frames)
    data.promp_for_data(@frames) while @frames.size < 10
    validate_last_frame
    printer.print_game
  end

  def validate_last_frame
    if @frames.last.score == 10
      data = GameData.new
      data.promp_for_data(@frames)
    end
  end
end

game = BowlingGame.new
game.start
