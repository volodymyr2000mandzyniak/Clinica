class RecommendationsController < ApplicationController

    def new
      @appointment = Appointment.find(params[:appointment_id])
      @recommendation = Recommendation.new(appointment: @appointment)
    end

    def create
      @appointment = Appointment.find(params[:appointment_id])
      @recommendation = @appointment.build_recommendation(recommendation_params)

      if @recommendation.save
        # Оновити статус запису на 'closed'
        @appointment.update(status: 'closed')

        redirect_to appointment_path(@appointment), notice: 'Recommendation was successfully created.'
      else
        render :new
      end
    end

    private

    def recommendation_params
      params.require(:recommendation).permit(:content)
    end
end

