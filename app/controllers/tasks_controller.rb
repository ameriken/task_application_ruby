class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new

  end

  def create
    task = Task.new (task_params)
    task.save!
    flash[:notice] = "タスク「#{task.name}」を登録しました。"
    redirect_to tasks_url

  end

  def edit
  end

  private
  def task_params
    params.require(:task).permit(:name,:desciription)
  end
end
