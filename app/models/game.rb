class Game < ApplicationRecord

    after_update_commit { broadcast_update }
end
