# frozen_string_literal: true

class Bulletin < ApplicationRecord
  belongs_to :category
  belongs_to :user

  has_one_attached :image

  # validates :image, attached: true,
  #                   content_type: %i[png jpg jpeg],
  #                   size: { less_than: 5.megabytes }
end
