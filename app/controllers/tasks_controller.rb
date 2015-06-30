class TasksController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def complete
    task = Task.find params[:task_id]
    task.toggle_complete!
    render json: { status: :ok }
  end
end