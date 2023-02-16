# frozen_string_literal: true

# Bulletins
class CreateBulletins < ActiveRecord::Migration[7.0]
  def change
    create_table :bulletins do |t|
      t.string :title
      t.text :description
      t.integer :category_id
      t.integer :user_id

      t.timestamps
    end
  end
end
