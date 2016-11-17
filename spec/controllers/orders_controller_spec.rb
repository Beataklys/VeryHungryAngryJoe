require 'rails_helper'

RSpec.describe OrdersController, type: :controller do


    it "redirects after create order to the root path" do
      post :create
      expect{redirect_to root_path }
    end
end
