class ExamplePagesController < ApplicationController
  def hello_method
    render json: { message: "hello!" }
  end

  def fibonacci_sequence
    fibonacci_numbers = []
    num_1 = 0
    num_2 = 1
    fibonacci_numbers << num_1
    fibonacci_numbers << num_2

    98.times do
      sum = num_1 + num_2
      fibonacci_numbers << sum
      num_1 = num_2
      num_2 = sum
    end

    render xml: { message: "#{fibonacci_numbers}" }
  end

  def countdown_method
    number = 10
    number_array = []
    while number >= 1
      number_array << number
      number = number - 1
      if number == 0
        render html: "<p> 10, 9, 8, 7, 6, 5, 4, 3, 2, 1.. </p> <h1> Blast off! </h1>".html_safe
      end
    end
  end

  def time
    render html: "<h3> Welcome to my time app!</h3> <h1> #{Time.now.strftime("%b %e, %l:%M %p")}</h1>".html_safe
  end
end
