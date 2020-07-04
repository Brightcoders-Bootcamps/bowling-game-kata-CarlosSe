# frozen_string_literal: true

# This class handle errors
class Errors
  def initialize
    @errors = false
  end

  def validate_data(first_shoot, second_shoot)
    @errors = true if (first_shoot || second_shoot).negative? || (first_shoot || second_shoot) > 10
    @errors = true if (first_shoot + second_shoot) > 10
    @errors ? handle_errors : false
    @errors
  end

  def handle_errors
    puts 'Error en los datos'
  end
end
