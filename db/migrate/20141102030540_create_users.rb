class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :username
      t.string :status
      t.timestamps
    end
  end

  def self.down
    drop_table :counts
  end
end