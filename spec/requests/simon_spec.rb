require 'rails_helper'

# RSpec.describe SimonController, type: :controller do
#   describe "GET /" do
#     it 'should return HTTP 200' do
#       get :input
#       expect(response).to have_http_status(:ok)
#     end
#   end
#
#   describe "POST /show" do
#
#     it 'should calculate 4 simon numbers' do
#       post :show, :params => {:start=>1, :end=>10}
#       expect(response).to have_http_status(:ok)
#       expect(assigns(:res)).to eq([[2, 3,6],
#                                    [3, 4, 24],
#                                    [5, 5, 120],
#                                    [9, 6, 720]])
#     end
#
#     it 'should redirect with error' do
#       post :show, :params => {:start=>'a', :end=>10}
#       expect(response).to redirect_to('/')
#
#       expect(flash[:alert]).to eq('Начало интервала должно быть целым неотрицательным числом')
#     end
#   end
# end
