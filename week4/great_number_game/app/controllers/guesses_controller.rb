class GuessesController < ApplicationController
  def main
    if !session[:rand_num]
      @rand = random_numb
    end
    @msg = flash[:msg]
  end

  def guess_result
    @guess = params[:guess].to_i
    if @guess < session[:rand_num]
      flash[:msg] = "Too low"
    elsif @guess > session[:rand_num]
      flash[:msg] = "Too high"
    else
      flash[:msg] = "You guessed it!!"
    end
    redirect_to "/"
  end

  def random_numb
    session[:rand_num] = rand(1..100)
  end

  def replay
    session[:rand_num] = nil
    redirect_to "/"
  end
end
