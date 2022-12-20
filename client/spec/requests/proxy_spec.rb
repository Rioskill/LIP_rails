require 'rails_helper'

RSpec.describe ProxyController, type: :request do
  it 'should return xml when client side is chosen' do
    get result_path, params: { start: 1, end: 10, side: 'client' }
    expect(response.content_type).to eq 'application/xml; charset=utf-8'
  end

  it 'should return html when server side is chosen' do
    get result_path, params: { start: 1, end: 10, side: 'server' }
    expect(response.content_type).to eq 'text/html; charset=utf-8'
  end

  it 'should return xml when no side is chosen' do
    get result_path, params: { start: 1, end: 10}
    expect(response.content_type).to eq 'application/xml; charset=utf-8'
  end
end
