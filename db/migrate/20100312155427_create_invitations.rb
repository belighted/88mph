class CreateInvitations < ActiveRecord::Migration

  def self.up
    create_table :invitations do |t|
      t.string :email
      t.references :user
      t.timestamps
    end
  end

  def self.down
    drop_table :invitations
  end

end