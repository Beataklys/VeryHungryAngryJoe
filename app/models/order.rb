class Order < ApplicationRecord
  belongs_to :user

  scope :active, -> { where(order_status: 'Ordered') }
  scope :history, -> { where(order_status: %w(Finalized Delivered)) }
end
