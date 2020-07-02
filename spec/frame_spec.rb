# frozen_string_literal: true

require_relative '../app/frame'

RSpec.describe Frame do
  before(:all) do
    @first_frame = Frame.new(10, 0)
    @second_frame = Frame.new(1, 6)
    @third_frame = Frame.new(3, 4)
    @third_frame.calculate_score_bonus([@second_frame, @first_frame])
  end

  it 'Calculate the score without bonus' do
    expect(Frame.new(3, 5).score).to eq(8)
  end

  it 'Calculate the score with a strike bonus' do
    expect(@first_frame.score).to eq(17)
  end

  it 'Calculate the bonus score with 1 strike' do
    @first_frame = Frame.new(10, 0)
    @second_frame = Frame.new(10, 0)
    @third_frame = Frame.new(3, 4)
    @third_frame.calculate_score_bonus([@second_frame, @first_frame])
    expect(@first_frame.score).to eq(23)
  end

  it 'Calculate the bonus score with 2 strikes' do
    @first_frame = Frame.new(10, 0)
    @second_frame = Frame.new(10, 0)
    @third_frame = Frame.new(10, 0)
    @third_frame.calculate_score_bonus([@second_frame, @first_frame])
    expect(@first_frame.score).to eq(30)
  end

  it 'Calculate the bonus score with 1 Spare' do
    @first_frame = Frame.new(10, 0)
    @second_frame = Frame.new(4, 2)
    @third_frame.calculate_score_bonus([@second_frame, @first_frame])
    expect(@first_frame.score).to eq(16)
  end
end
