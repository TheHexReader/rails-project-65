# frozen_string_literal: true

# Add admin
class AddAdmin < ActiveRecord::Migration[7.0]
  def change
    user = User.find_by(email: 'thehexreader@gmail.com')
    user ||= User.create!(email: 'thehexreader@gmail.com')
    user.update(admin: true)
  end
end
