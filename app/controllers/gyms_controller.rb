class GymsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :rescue_from_record_not_found
    def show
        gym = Gym.find(params[:id])
        render json: gym, status: :ok
    end

    def destroy
        gym = Gym.find(params[:id])
        gym.membership.destroy_all
        gym.destroy
        render json: gym, status: :not_found
    end

    private

    def rescue_from_record_not_found
        render json: {errors: "Gym not found"}, status: :not_found
    end
end
