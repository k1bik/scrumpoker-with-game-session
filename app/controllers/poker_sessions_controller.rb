class PokerSessionsController < ApplicationController
  before_action :authenticate_user

  def index
    @poker_sessions = PokerSession.all
  end

  def show
    @poker_session = PokerSession.includes(:creator, :tasks).friendly.find params[:id]
    @poker_session.participants << current_user unless @poker_session.participants.exists? current_user.id
  end

  def edit
    @poker_session = PokerSession.includes(:creator).friendly.find params[:id]
  end

  def new
    @view_model = ViewModels::PokerSessionCreation.new
  end

  def update
    poker_session = PokerSession.friendly.find params[:id]

    if poker_session.update poker_session_params
      redirect_to poker_session_path(poker_session), notice: "Successfully updated"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def create
    @view_model = ViewModels::PokerSessionCreation.new(
      poker_session_params.merge(
        creator: current_user,
        friendly_name: PokerSession.generate_friendly_name(poker_session_params[:name])
      )
    )

    if @view_model.valid?
      poker_session = PokerSession.create!(
        name: @view_model.name,
        estimates: @view_model.estimates,
        creator: @view_model.creator,
        password: @view_model.password,
        friendly_name: @view_model.friendly_name
      )

      redirect_to poker_session_path(poker_session), notice: "Successfully created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private def poker_session_params
    params.require(:poker_session).permit(:name, :estimates, :password)
  end
end
