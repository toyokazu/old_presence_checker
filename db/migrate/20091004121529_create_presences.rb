class CreatePresences < ActiveRecord::Migration
  def self.up
    create_table :presences do |t|
      t.string :login
      t.string :name
      t.string :mail
      t.references :course
      t.string :ip_addr
      t.boolean :proxyed
      t.references :lecture
      t.timestamp :deleted_at

      t.timestamps
    end
    add_index(:presences, [:login, :lecture_id], :unique => true)
  end

  def self.down
    remove_index(:presences, :column => [:login, :lecture_id])
    drop_table :presences
  end
end
