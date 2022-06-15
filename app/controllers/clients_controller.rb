class ClientsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

    def show
        client = Client.find(params[:id])
        render json: client, status: 200
    end

    private
    def record_not_found
        render json: {error: "client not found"}, status: :not_found
    end
end
