# frozen_string_literal: true

class Bulletin < ApplicationRecord
  has_one :category
  has_one :user

  has_one_attached :image

  validates :image, attached: true,
                    content_type: %i[png jpg jpeg],
                    size: { less_than: 5.megabytes }
end
