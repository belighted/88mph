class CreateTimeSlots < ActiveRecord::Migration

  def self.up
    create_table :time_slots do |t|
      t.datetime :start
      t.datetime :end
      t.user :references
      t.project :references
      t.timestamps
    end
  end

  def self.down
    drop_table :time_slots
  end

end