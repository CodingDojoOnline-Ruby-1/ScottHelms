class RpgController < ApplicationController
  def main
    if !session[:history]
      session[:history] = []
    end
    if !session[:total]
      session[:total] = 0
    end
    @histored = session[:history]
  end

  def farm
    @farm = rand(10..20)
    session[:total] += @farm.to_i
    flash[:msg] = "You dug up #{@farm} gold at the Farm"
    session[:history].push(flash[:msg])
    redirect_to "/"
  end

  def cave
    @cave = rand(5..10)
    session[:total] += @cave.to_i
    flash[:msg] = "You discovered #{@cave} gold in the Cave"
    session[:history].push(flash[:msg])
    redirect_to "/"
  end

  def casino
    @casino = rand(-50..50)
    session[:total] += @casino.to_i
    if @casino < 0
      flash[:msg] = "You lost #{@casino} gold, bonehead!"
    elsif @casino > 0
      flash[:msg] = "You won #{@casino} gold, Pal!!"
    else
      flash[:msg] = "Well, ya broke even, brah"
    end
    session[:history].push(flash[:msg])
    redirect_to "/"
  end

  def house
    @house = rand(2..5)
    session[:total] += @house.to_i
    flash[:msg] = "You found #{@house} gold in the house"
    session[:history].push(flash[:msg])
    redirect_to "/"
  end

  def clear_it
    session.clear
    redirect_to "/"
  end
end
