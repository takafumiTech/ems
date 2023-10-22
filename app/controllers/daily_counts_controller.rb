class DailyCountsController < ApplicationController
  before_action :authenticate_user!

  def index
    @daily_counts = DailyCount.all
    @daily_count = DailyCount.order(date: :desc).limit(1)
  end

  def search
    @daily_counts = DailyCount.all
    @daily_count = DailyCount.new(daily_count_params)
    if @daily_count.date.present?
      @daily_count = DailyCount.where('date = ?', "#{@daily_count.date}")
    else
      @daily_count = DailyCount.none
    end
      render :index
  end

  def new
    @daily_count = DailyCount.new
  end

  def create
    @daily_count = DailyCount.new(daily_count_params)
    if @daily_count.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @daily_count = DailyCount.find(params[:id])
  end

  def update
    @daily_count = DailyCount.find(params[:id])
    if @daily_count.update(daily_count_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def daily_count_params
    params.require(:daily_count).permit(:date, :delivery_count, :repair_count, :exchange_count).merge(user_id: current_user.id)
  end
end
