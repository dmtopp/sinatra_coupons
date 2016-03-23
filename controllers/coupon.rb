class CouponController < ApplicationController
  get '/' do
    erb :form
  end

  post '/' do
    @coupon = Coupon.create({
      :title => params[:title],
      :description => params[:description],
      :product => params[:product],
      :discount_price => params[:discount_price],
      :expiration_date => params[:expiration_date]
      })
    @coupons = Coupon.all
    erb :all
  end
end
