require 'rails_helper'

RSpec.describe Api::V1::CardsController, type: :controller do

  describe "GET index" do
    it "should give sucess response" do
      get :index
      expect(response).to have_http_status(:ok)
    end
  end

  describe "POST create" do
    it "should give sucess response" do
      post :create, params: { "text" => "test" }
      expect(response).to have_http_status(:created)
    end
  end
end
