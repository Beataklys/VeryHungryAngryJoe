class Order < ApplicationRecord
  belongs_to :user
  validates :restaurant_name, presence: true
  validates :price,  presence: true, :numericality  => {:greater_than_or_equal_to => 0}
  validates :dish_name, :presence =>{:message =>"cannot be blank"}

  scope :active, -> { where(order_status: 'Ordered') }
  scope :history, -> { where(order_status: 'Delivered') }
  scope :finalized, -> {where(order_status: 'Finalized')}

  def finalize!
    self.update_attribute(:order_status, 'Finalized')
  end
  
  def delivered!
    self.update_attribute(:order_status, 'Delivered')
  end
end
