class SchedulesController < ApplicationController
  def index
    @schedules = Schedule.all
  end
  
  def new
    @schedule = Schedule.new
  end
  
  def create
    @schedule = Schedule.new(params.require(:schedule).permit(:title, :startDate, :endDate, :allDay, :memo))
    if @schedule.save
      flash[:notice] = "スケジュールを登録しました"
      redirect_to :schedules
    else
      flash[:alert] = "スケジュールを登録できませんでした"
      render "new", status: :unprocessable_entity
    end
  end
  
  def show
    @schedule = Schedule.find(params[:id])
  end
  
  def edit
    @schedule = Schedule.find(params[:id])
  end
  
  def update
    @schedule = Schedule.find(params[:id])
    if @schedule.update(params.require(:schedule).permit(:title, :startDate, :endDate, :allDay, :memo))
      flash[:notice] = "ID「#{@schedule.id}」のスケジュールを更新しました"
      redirect_to :schedules
    else
      render "edit"
    end
  end
  
  def destroy
    @schedule = Schedule.find(params[:id])
    @schedule.destroy
    flash[:warning] = "ID「#{@schedule.id}」のスケジュールを削除しました"
    redirect_to @schedule, status: :see_other
  end
  
end
