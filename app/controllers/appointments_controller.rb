class AppointmentsController < ApplicationController
  helper_method :appointments, :appointment

  before_action :check_created_by, only: [ :edit, :update ]

  def update
    if appointment.update(appointment_params)
      redirect_to appointments_path, notice: "Appointment updated!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def check_created_by
    unless appointment.created_by?(Current.user)
      redirect_to appointments_path, alert: "Can't modify appointment - you are not the creator."
    end
  end

  def appointment_params
    params.require(:appointment).permit(
      :requested_datetime,
      :notes
    )
  end

  def appointment
    @appointment ||= Appointment.find(params[:id])
  end

  def appointments
    @appointments ||= Appointment.includes(:created_by).all
  end
end
