class TasksController < ApplicationController
  def complete
    task = Task.find params[:task_id]
    task.toggle_complete!
    render json: { status: :ok }
  end

  def create
    # Task.new(content: params[:task_name], list_id: params[:list_id])
    list = List.find params[:list_id]
    task = list.tasks.create! content: params[:task_name]
    render json: task
  end

  def destroy
    task = Task.find_by params[:id]
    list = task.list_id
    task.delete
    redirect_to list_path list
  end
end