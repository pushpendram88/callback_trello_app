# frozen_string_literal: true

module Api
  module V1
    # This controller work as a webhooks
    class WebhooksController < ApplicationController
      def index
        #   - insert the card to database if the event type is "createCard"
        #   - update the card in database if the event type is "updateCard"
        #   - delete the card in database if the event type is "deleteCard"
      end

      def show
        puts 'Register with trello successfully'
      end

      def create
        case params[:webhook][:action][:type]
        when 'createCard'
          card = Card.new(permit_params)
          card.trello_card_id = create_params[:id]
          if card.save
            render json: { message: 'Card created successfully.', card: card }, status: 201
            puts 'Card Created Successfully'
          else
            render json: { message: 'Card Not Created.', errors: card.errors.full_messages }, status: 422
            puts "Error: #{card.errors.full_messages}"
          end
        when 'updateCard'
          update
        when 'deleteCard'
          destroy
        else
          puts 'invaild Data'
        end
      end

      def update
        card = Card.find_by(trello_card_id: fetch_card_id[:id])
        render json: { message: 'Card not found' } and return unless card.present?

        if card.update(permit_params)
          render json: { message: 'Card update successfully.', card: card }, status: 204
          puts 'card updated successfully'
        else
          render json: { message: 'not updated', errors: card.errors.full_messages }, status: 422
          puts "Error: #{card.errors.full_messages}"
        end
      end

      def destroy
        card = Card.find_by(trello_card_id: destroy_params[:id])
        render json: { message: 'Card not found' } and return unless card.present?

        if card.destroy
          render json: { message: 'Card deleted successfully.' }, status: 200
        else
          render json: { errors: card.errors.full_messages.to_s }, status: 422
        end
      end

      private

      def create_params
        params[:webhook][:action][:display][:entities][:card].permit(:id)
      end

      def permit_params
        params[:webhook][:action][:display][:entities][:card].permit(:text)
      end

      def fetch_card_id
        params[:webhook][:action][:display][:entities][:card].permit(:id)
      end

      def destroy_params
        params[:webhook][:action][:data][:card].permit(:id)
      end
    end
  end
end
