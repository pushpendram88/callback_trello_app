require 'rails_helper'

RSpec.describe Api::V1::WebhooksController, type: :controller do

  let!(:card) { create(:card) }

  describe "POST create" do
    it "should give sucess response" do
      post :create, params: { webhook: { action: {type: "createCard", display: { entities: { card: { id: card.id, text: "abc"}}}}}}
      expect(response).to have_http_status(:created)
    end
    
    it "should not create and give unprocessable entity" do
      post :create, params: { webhook: { action: {type: "createCard", display: { entities: { card: { id: card.id, text: nil}}}}}}
      expect(response).to have_http_status(:unprocessable_entity)
    end

    it "should not delete and give record not found" do
      post :create, params: { webhook: { action: {type: "Card", data: { card: { id: card.id }}}}}
      expect(response.body).to eq("")
    end 
  end

  describe "PUT update" do
    it "should give sucess response" do
      post :create, params: { webhook: { action: {type: "updateCard", display: { entities: { card: { id: card.id, text: "abc"}}}}}}
      expect(response).to have_http_status(204)
    end

    it "should not update and give unprocessable entity" do
      post :create, params: { webhook: { action: {type: "updateCard", display: { entities: { card: { id: card.id, text: nil}}}}}}
      expect(response).to have_http_status(422)
    end
  end

  describe "DELETE destroy" do
    it "should give sucess response" do
      post :create, params: { webhook: { action: {type: "deleteCard", data:  { card: { id: card.id }}}}}
      expect(response).to have_http_status(200)
    end
  end

  describe "GET show" do
    it "should give Register with trello successfully Response" do
      get :show
      expect(response.body).to eq("")
    end
  end
end
