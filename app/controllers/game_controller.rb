class GameController < ApplicationController
  def index
    puts Game.find(1)
    puts "hi"
    @game = Game.find(1)
  end
end
