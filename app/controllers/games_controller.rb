class GamesController < ApplicationController
  VOWELS = %w[A E I O U]

  def new
    @letters = Array.new(5) { VOWELS.sample }
    @letters += Array.new(5) { (('A'..'Z').to_a - VOWELS).sample }
    @letters.shuffle!
  end

  def score
    # get the random letters from the params
    @letters = params[:letters].split
    # get the letters submitted by the user, split them up
    @word = (params[:word] || '').upcase
    @included = @word.chars.all? { |letter| word.count(letter) <= letters.count(letter) }
    @english_word = included?(@word, @letters)
  end

  private

  def included?(word, letters)
    word.chars.all? { |letter| word.count(letter) <= letters.count(letter) }
  end
end
