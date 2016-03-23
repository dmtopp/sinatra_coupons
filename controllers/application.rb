class ApplicationController < Sinatra::Base

  require 'bundler'
  Bundler.require

  ActiveRecord::Base.establish_connection(
    :adapter => 'postgresql',
    :database => 'sinatra_coupons'
  )

  set :views, File.expand_path('../../views', __FILE__)
  set :public_dir, File.expand_path('../../public', __FILE__)

  get '/' do
    @coupons = Coupon.all
    erb :all
  end

  post '/' do
    @coupon = Coupon.find(params[:coupon_id])
    @coupon.destroy
    @coupons = Coupon.all
    erb :all
  end

  post '/update' do
    @coupon = Coupon.find(params[:coupon_id])
    @id = params[:coupon_id]
    @coupons = Coupon.all
    erb :update
  end

  post '/update/coupon' do
    @coupon = Coupon.find(params[:coupon_id])
    @coupon.title = params[:title]
    @coupon.description = params[:description]
    @coupon.product = params[:product]
    @coupon.discount_price = params[:discount_price]
    @coupon.expiration_date = params[:expiration_date]
    @coupon.save
    @coupons = Coupon.all
    erb :all
  end
end
