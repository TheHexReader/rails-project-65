# frozen_string_literal: true

class Bulletin < ApplicationRecord
  include AASM

  aasm do
    state :draft, initial: true
    state :under_moderation, :published, :rejected, :archived

    event :moderate do
      transitions from: :draft, to: :under_moderation
    end

    event :publish do
      transitions from: :under_moderation, to: :published
    end

    event :reject do
      transitions from: :under_moderation, to: :rejected
    end

    event :archive do
      transitions from: %i[published under_moderation draft rejected], to: :archived
    end
  end

  belongs_to :category
  belongs_to :user

  has_one_attached :image

  # validates :image, attached: true,
  #                   content_type: %i[png jpg jpeg],
  #                   size: { less_than: 5.megabytes }
end
