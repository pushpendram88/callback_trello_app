# frozen_string_literal: true

module Api
  module V1
    # This controller user to create cards.
    class CardsController < ApplicationController
      include Trello
      # TODO: Fill the controller actions for the API
      def index
        render json: Card.all
      end

      def create
        @card = Card.new(permit_params)
        response = begin
          JSON.parse(create_card_in_trello.read_body)
        rescue StandardError
          create_card_in_trello.to_s
        end

        if response['id'].present?
          render json: { message: 'Card created successfully.', card: @card }, status: 201
          puts 'Data Created'
        else
          render json: { errors: create_card_in_trello.read_body }, status: 422
        end
      end

      private

      def permit_params
        params.permit(:text)
      end
    end
  end
end
