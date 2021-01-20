class IntakesController < ApplicationController
    before_action :find_intake, only: [:show]

    def show
        render
    end

    private

    def find_intake
        @intake = Intake.find(params[:id])
    end

    def intake_params
        params.require(:intake).permit(:id, :email)
    end
end