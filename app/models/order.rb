class Order < ApplicationRecord
  belongs_to :user

  scope :active, -> { where(order_status: 'Active') }
  scope :history, -> { where(order_status: %w(Finalized Ordered Delivered)) }
end
