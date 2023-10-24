class ManagementsController < ApplicationController
  def index
    @managements = Management.all
    @daily_count = DailyCount.new
    @daily_counts = DailyCount.order(date: :desc).limit(14)
    @calculate = calculate
    
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

  def edit
    @management = Management.find(params[:id])
  end
  
  def update
    @management = Management.find(params[:id])
    if management.update(management_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private
  
  def management_params
    params.require(:management).permit(:item_name, :unit, :lead_time, :current_amount, :spare, :consumption_by_delivery, :consumption_by_repair, :consumption_by_exchange).merge(user_id: current_user.id)
  end

  def calculate
    sum = 0
    @daily_counts.each do |count|
      sum += count.delivery_count
    end
    calculate = sum / 14
  end
end
