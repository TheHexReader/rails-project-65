# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :bulletins

  def self.ransackable_attributes(_auth_object = nil)
    %w[created_at id name updated_at]
  end

  validates :name, presence: true
end
