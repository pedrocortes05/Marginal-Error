require "matrix"

class Player
    @@no_of_players = 0
    def initialize(id)
        @id = id
    end

    attr_reader :id
end

class Changes
    def initialize(id, row, col)
        @id = id
        @row = row
        @col = col
    end

    attr_reader :id
    attr_reader :row
    attr_reader :col
end

class UpdateTickJob < ApplicationJob
  queue_as :default

  def perform(*args)
    puts "REFRESH CANVAS"

    game = Game.find(1)
    players = Player.all

    $rows = game.height
    $cols = game.width

    map = Matrix.zero($rows, $cols)

    map[rand(0..($rows - 1)), rand(0..($cols - 1))] = p1.id
    map[rand(0..($rows - 1)), rand(0..($cols - 1))] = p2.id

    print_map(map)

    # run game
    update_map(map)

    # Print map
    print_map(map)

  end
end

# probably want to make changes into a Table
$changes = []
$dict = { 0 => [-1, 0], 1 => [-1, 1], 2 => [0, 1], 3 => [1, 1], 4 => [1, 0], 5 => [1, -1], 6 => [0, -1], 7 => [-1, -1] }

def update_map(map)
  for i in 0..($rows - 1)
    for j in 0..($cols - 1)
      if map[i, j] != 0
        current_p = map[i, j]
        prob = 8.times.map { rand() }
        for k in 0..7
          if prob[k] < 0.2
            row, col = add_arrays([i, j], $dict[k])
            if row >= 0 and row < $rows and col >= 0 and col < $cols
              $changes.append(Changes.new(current_p, row, col))
            end
          end
        end
      end
    end
  end

  for change in $changes
    map[change.row, change.col] = change.id
  end
end

def add_arrays(arr1, arr2)
  if arr1.length() != arr2.length()
    return false
  end

  sum_array = []
  for i in Range.new(0, arr1.length() - 1)
    sum_array.append(arr1[i] + arr2[i])
  end

  return sum_array
end

def print_map(map)
  for i in 0..($rows - 1)
    for j in 0..($cols - 1)
      print(map[i, j].to_s + ' ')
    end

    puts
  end

  puts
end
