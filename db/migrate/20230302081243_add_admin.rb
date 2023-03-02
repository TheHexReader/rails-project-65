# frozen_string_literal: true

# Add admin
class AddAdmin < ActiveRecord::Migration[7.0]
  def change
    User.find_by(email: 'thehexreader@gmail.com').update(admin: true)
  end
end
