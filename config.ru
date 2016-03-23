require 'sinatra/base'

require './controllers/application'
require './controllers/coupon'

require './models/coupon'

map('/') { run ApplicationController }
map('/form') { run CouponController }
