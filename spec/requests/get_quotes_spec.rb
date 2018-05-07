require 'rails_helper'

describe "get all quotes route", :type => :request do
  let!(:quotes) { FactoryBot.create_list(:quote, 20)}

  before { get '/quotes'}

# first test
  it 'returns all quotes' do
    expect(JSON.parse(response.body).size).to eq(20)
  end
# second test
  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end
end
