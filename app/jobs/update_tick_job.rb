class UpdateTickJob < ApplicationJob
  queue_as :default

  def perform(*args)
    puts "refresh canvas"
  end
end
