class GameController < ApplicationController
  def index
    UpdateTickJob.perform_now
    puts Game.find(1)
    puts "hi"
    @game = Game.find(1)
  end
end
