class TimeSlotsController < ApplicationController
  before_filter :require_user

  before_filter :find_time_slot

  def edit; end

  def update
    if @time_slot.update_attributes(params[:time_slot])
      flash[:notice] = "Time slot updated"
      redirect_to user_path(@user)
    else
      flash[:notice] = "Time slot could not be updated"
      render :edit
    end
  end

  private
  def find_time_slot
    @time_slot = TimeSlot.find(params[:id])
    @user = @current_user
  end
end