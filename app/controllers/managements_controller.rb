class ManagementsController < ApplicationController
  def index
  end

  def new
    @management = Management.new
  end

  def create
    @management = Management.new(management_params)
    if @management.save
      redirect_to root_path
    else
      render:new
    end
  end

  private
  
  def management_params
    params.require(:management).permit(:item_name, :unit, :lead_time, :current_amount, :spare, :consumption_by_delivery, :consumption_by_repair, :consumption_by_exchange).merge(user_id: current_user.id)
  end
end
