require 'sinatra'
require 'sinatra/reloader'

NUMBER = rand(100)

def check_guess(guess)
  guess = guess.to_i
  if guess > NUMBER
    "Too high!"
  elsif guess < NUMBER
    "Too low!"
  elsif guess == NUMBER
    "You got it right! The secret number is #{NUMBER}"
  elsif guess - NUMBER > 5
    "Way too high!"
  elsif NUMBER - guess > 5
    "Way too low!"
  end
end

get '/' do
  guess = params["guess"]
  message = check_guess(guess)
  erb :index, :locals => {:number => NUMBER, :message => message}
end




