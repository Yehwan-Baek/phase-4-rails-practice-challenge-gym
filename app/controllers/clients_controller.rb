class ClientsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
    
    def index
        clients = Client.all
        render json: clients
    end

    def show
        client = find_client
        total_amount = client.memberships.sum(:charge)
        render json: { client: client, total_amount: total_amount }, include: "gyms"
    end

    def update
        client = find_client
        client.update(client_params)
        render josn: client
    end

    private

    def find_client
        Client.find(params[:id])
    end

    def client_params
        params.permit(:name, :age)
    end

    def render_not_found_response
        render json: { error: "Client not found" }, status: :not_found
    end

    def render_unprocessable_entity_response(exception)
        render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
    end
end
