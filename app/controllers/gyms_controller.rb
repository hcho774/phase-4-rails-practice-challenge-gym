class GymsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

    def show
        gym = Gym.find(params[:id])
        render json: gym, status: :ok
    end

    def destroy
        byebug
        gym = Gym.find(params[:id])
        gym.memberships.destroy_all
        gym.destroy
        head :no_content
    end

    private
    def record_not_found
        render json: {error: "Gym not found"}, status: :not_found
    end
end
