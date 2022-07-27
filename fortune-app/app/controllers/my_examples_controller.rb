class MyExamplesController < ApplicationController
  def fortune_app
    fortunes = ["Don't panic.", "You are about to finish reading a fortune..", "This fortune is never gonna give you up, never gonna let you down.", "Error 404: Fortune not found", "To truly find yourself, you should play hide and seek alone."]

    lotto_numbers = []
    6.times do
      number = rand(1..99).to_i
      lotto_numbers << number
    end

    render html: "<h1> Welcome to the Fortune App!</h1> <h3> Your fortune is:</h3> <h2> #{fortunes.sample}</h2><h3> Your winning lottery numbers are:</h3> <h2> #{lotto_numbers}</h2>".html_safe
  end

  # def random_lotto
  #   lotto_numbers = []
  #   6.times do
  #     number = rand(1..99).to_i
  #     lotto_numbers << number
  #   end
  #   render html: "<h1> Welcome to the Fortune App!</h1> <h3> Your winning lottery numbers are:</h3> <h2> #{lotto_numbers}</h2>".html_safe
  # end

  def lyrics
    number = 99
    lyrics_array = []
    99.times do
      if number <= 100 && number >= 2
        lyrics = "#{number} bottles of beer on the wall, #{number} bottles of beer. Take one down and pass it around, #{number} bottles of beer on the wall"
        lyrics_array << lyrics
        number = number - 1
      elsif number == 1
        lyrics = "1 bottle of beer on the wall, 1 bottle of beer. Take one down and pass it around, no more bottles of beer on the wall"
        lyrics_array << lyrics
      end
    end
    lyrics = "No more bottles of beer on the wall, no more bottles of beer. Go to the store and buy some more, 99 bottles of beer on the wall."
    lyrics_array << lyrics
    render html: "<h1> '99 Bottles of Beer'</h1> <p> #{lyrics_array}</p>".html_safe
  end
end
