require 'rails_helper'

RSpec.describe SimonController, type: :controller do
  render_views

  describe 'GET /show' do

    it 'should calculate 4 simon numbers' do
      get :show, params: { start: 1, end: 10 }

      expect(response).to have_http_status(:ok)
      expect(assigns(:res)).to eq([[2, 3, 6],
                                   [3, 4, 24],
                                   [5, 5, 120],
                                   [9, 6, 720]])
    end

    it 'should return error' do
      get :show, params: { start: 'a', end: 10 }
      expect(response.body).to eq('<error_msg>Начало интервала должно быть целым неотрицательным числом</error_msg>')
    end

    it 'should return error' do
      get :show, params: { start: 1, end: 'b' }
      expect(response.body).to eq('<error_msg>Конец интервала должен быть целым неотрицательным числом</error_msg>')
    end

    it 'should generate different xmls' do
      get :show, params: { start: 1, end: 10 }
      first_xml = response.body
      get :show, params: { start: 6, end: 10 }
      second_xml = response.body

      expect(first_xml).not_to eq(second_xml)
    end
  end
end
