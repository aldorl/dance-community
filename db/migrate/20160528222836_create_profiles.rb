class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.belongs_to :member, index: true, foreign_key: true
      t.string :firstname
      t.string :lastname
      t.string :location
      t.string :bio

      t.timestamps null: false
    end
  end
end
