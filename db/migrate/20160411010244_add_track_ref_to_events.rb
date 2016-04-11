class AddTrackRefToEvents < ActiveRecord::Migration
  def change
    add_reference :events, :track, index: true, foreign_key: true
  end
end
