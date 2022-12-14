class ClientsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :rescue_from_record_not_found
    def show
        client = Client.find(params[:id])
        render json: client, status: :ok
    end

    private
    def rescue_from_record_not_found
        render json: {errors: "Client not found"}, status: :not_found
    end
end
