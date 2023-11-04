class DailyCountsController < ApplicationController
  before_action :same_sentence, only: [:edit, :update]
  before_action :move_to_index, only: [:edit]

  def index
    @daily_counts = DailyCount.all
    @daily_count = DailyCount.order(date: :desc).limit(2)
  end

  def search
    @daily_counts = DailyCount.all
    @daily_count = DailyCount.new(daily_count_params)

    @daily_count = if @daily_count.date.present?
                     DailyCount.where('date = ?', "#{@daily_count.date}")
                   else
                     DailyCount.none
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
  end

  def update
    if @daily_count.update(daily_count_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def same_sentence
    @daily_count = DailyCount.find(params[:id])
  end

  def move_to_index
    return if current_user.id == @daily_count.user_id

    redirect_to root_path
  end

  def daily_count_params
    params.require(:daily_count).permit(:date, :delivery_count, :repair_count, :exchange_count).merge(user_id: current_user.id)
  end
end
