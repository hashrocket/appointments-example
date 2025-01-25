class AppointmentsController < ApplicationController
  helper_method :appointments

  def index
  end

  private

  def appointments
    @appointments ||= Appointment.all
  end
end
