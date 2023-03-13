require "json"
require "open-uri"

class GamesController < ApplicationController
  def new
    @letters = ('a'..'z').to_a.sample(10)
  end

  def score
    @answer = params[:guess]
    @letters = params[:letters]
    url = "https://wagon-dictionary.herokuapp.com/#{@answer}"
    word_json = URI.open(url).read
    word = JSON.parse(word_json)

    answer_letters = @answer.split('')

    if @letters.include? answer_letters
      "sorry..."
    elsif word.found == false && @letters.include?(answer_letters)
      "also sorry..."
    elsif word.found == true && @letters.include?(answer_letters)
      "good one"
    else
      "..."
    end
  end
end
