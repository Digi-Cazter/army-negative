# encoding: utf-8
class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :username
      t.boolean :enabled

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
