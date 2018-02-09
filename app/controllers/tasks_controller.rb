class TasksController < ApplicationController
  before_action :all_tasks, only: [:index, :create, :update]
  before_action :set_tasks, only: [:edit, :update]
  respond_to :html, :js

  def new
    @task = Task.new
  end

  def create
    @tasks = Task.create(task_params)
  end

  def update
    @task.update_attributes(task_params)
  end


  private

    def all_tasks
      @tasks = Task.all
    end

    def set_tasks
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:description, :deadline)
    end
end
