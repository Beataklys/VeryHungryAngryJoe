Order.destroy_all

user = User.create(name: 'John Doe')

50.times do
  user.orders.create(restaurant_name: 'Some Cool Restaurant',
                     dish_name: 'Cool Dish',
                     order_status: (%w(Active Finalized Ordered Delivered)).sample,
                     price: rand(10..200))
end
