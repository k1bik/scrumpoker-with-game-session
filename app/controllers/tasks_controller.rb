class TasksController < ApplicationController
  before_action :authenticate_user

  def new
    @view_model = ViewModels::PokerSessionTaskCreation.new
  end

  def edit
    @task = Task.find(params[:id])
    @view_model = ViewModels::PokerSessionTaskCreation.new(description: @task.description)
  end

  def create
    poker_session_friendly_name = params[:poker_session_id]
    @poker_session = PokerSession.find_by!(friendly_name: poker_session_friendly_name)
    @view_model = ViewModels::PokerSessionTaskCreation.new(task_params.merge(poker_session_id: @poker_session.id))

    if @view_model.valid?
      @task = Task.create!(task_params.merge(poker_session: @poker_session))

      respond_to do |f|
        f.turbo_stream
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  private def task_params
    params.require(:task).permit(:description)
  end
end
