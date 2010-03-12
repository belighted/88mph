class CreateParticipations < ActiveRecord::Migration

  def self.up
    create_table :participations do |t|
      t.references :user
      t.references :project
      t.timestamps
    end
  end

  def self.down
    drop_table :participations
  end

end