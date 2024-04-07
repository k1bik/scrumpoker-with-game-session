class PokerSessionsController < ApplicationController
  before_action :authenticate_user

  def index
    @poker_sessions = PokerSession.all
  end

  def show
    @poker_session = PokerSession.includes(:creator).friendly.find params[:id]
    @poker_session.participants << current_user unless @poker_session.participants.exists? current_user.id
  end

  def edit
    @poker_session = PokerSession.includes(:creator).friendly.find params[:id]
  end

  def new
    @view_model = ViewModels::PokerSession.new
  end

  def update
    poker_session = PokerSession.friendly.find params[:id]

    if poker_session.update poker_session_params
      flash[:notice] = "Successfully updated"
      redirect_to poker_session_path(poker_session)
    else
      flash.now[:alert] = "Invalid"
      render :edit
    end
  end

  def create
    friendly_name = "#{params[:poker_session][:name]}-#{Time.zone.today.strftime("%d-%m-%Y")}"
    attrs = poker_session_params.merge(creator: current_user, friendly_name:)
    @poker_session = PokerSession.new(attrs)

    if @poker_session.save
      @poker_session.participants << current_user
      flash[:notice] = "Successfully created"
      redirect_to poker_session_path(@poker_session)
    else
      flash.now[:alert] = "Invalid"
      redirect_to new_poker_session_path
    end
  end

  private def poker_session_params
    params
      .require(:poker_session)
      .permit(:name, :estimates, :password, tasks_attributes: [:id, :_destroy, :description])
  end
end
