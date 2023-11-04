class ManagementsController < ApplicationController
  before_action :same_sentence, except: [:index, :search, :new, :create]
  before_action :move_to_index, only: [:edit, :destroy, :purchase, :purchase_do]

  def index
    @managements = Management.order(:item_name)
    @daily_count = DailyCount.new
    @daily_counts = DailyCount.order(date: :desc).limit(14)
    @calculate = calculate
  end

  def search
    @managements = Management.search(params[:keyword])
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
  end

  def update
    if @management.update(management_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if @management.destroy
      redirect_to root_path
    else
      render :edit
    end
  end

  def purchase
  end

  def purchase_do
    if @management.update(management_params)
      redirect_to root_path
    else
      render :purchase
    end
  end

  private

  def same_sentence
    @management = Management.find(params[:id])
  end

  def move_to_index
    return if current_user.id == @management.user_id
    redirect_to root_path
  end
  
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
