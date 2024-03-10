require "rails_helper"

RSpec.describe PokerSessionsController, type: :controller do
  let(:current_user) { create(:user) }

  before { allow(controller).to receive(:current_user).and_return(current_user) }

  describe "GET #index" do
    before { create_list(:poker_session, 3) }

    it "assigns all poker sessions to @poker_session" do
      get :index
      expect(assigns(:poker_sessions)).to match_array(PokerSession.all)
    end
  end

  describe "GET #new" do
    it "assigns a new poker session to @poker_session" do
      get :new
      expect(assigns(:poker_session)).to be_a_new(PokerSession)
    end

    it "renders the new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe "GET #show" do
    subject { get :show, params: {id: poker_session.id} }

    let(:poker_session) { create(:poker_session) }

    it "renders the show template" do
      subject
      expect(response).to render_template :show
    end

    context "when current user not participant" do
      it "adds current user to poker session participants" do
        subject
        expect(poker_session.participants.first).to eq(current_user)
      end
    end
  end

  describe "GET #edit" do
    subject { get :edit, params: {id: poker_session.id} }

    let(:poker_session) { create(:poker_session) }

    it "renders the edit template" do
      subject
      expect(response).to render_template :edit
    end
  end

  describe "PATCH #update" do
    subject { patch :update, params: }

    let(:poker_session) { create(:poker_session) }

    context "with valid parameters" do
      let(:params) do
        {
          id: poker_session.id,
          poker_session: {
            name: "new name",
            estimates: "new estimates"
          }
        }
      end

      it "updates the poker session" do
        subject
        poker_session.reload
        expect(poker_session.name).to eq("new name")
        expect(poker_session.estimates).to eq("new estimates")
      end

      it "redirects to the updated poker session" do
        subject
        expect(response).to redirect_to(poker_session_path(poker_session))
      end

      it "sets a flash notice" do
        subject
        expect(flash[:notice]).to eq("Successfully updated")
      end
    end

    context "with invalid parameters" do
      let(:params) do
        {
          id: poker_session.id,
          poker_session: {
            name: "",
            estimates: "new estimates"
          }
        }
      end

      it "does not update the poker session" do
        old_name = poker_session.name
        subject
        poker_session.reload
        expect(poker_session.name).to eq(old_name)
      end

      it "renders the edit template" do
        subject
        expect(response).to render_template(:edit)
      end

      it "sets a flash alert" do
        subject
        expect(flash[:alert]).to eq("Invalid")
      end
    end
  end

  describe "POST #create" do
    subject { post :create, params: }

    context "with valid parameters" do
      let(:params) do
        {
          poker_session: {
            name: "name",
            estimates: "estimates",
            password: "password",
            tasks_attributes: {
              "0": {description: "task1", _destroy: false},
              "1": {description: "task2", _destroy: false}
            }
          }
        }
      end

      it "creates a new poker session" do
        expect { subject }.to change(PokerSession, :count).by(1)
      end

      it "assigns the current user as the creator of the poker session" do
        subject
        expect(PokerSession.last.creator).to eq(current_user)
      end

      it "adds the current user as a participant of the poker session" do
        subject
        expect(PokerSession.last.participants).to include(current_user)
      end

      it "redirects to the created poker session" do
        subject
        expect(response).to redirect_to(poker_session_path(PokerSession.last))
      end

      it "sets a flash notice" do
        subject
        expect(flash[:notice]).to eq("Successfully created")
      end
    end

    context "with invalid parameters" do
      let(:params) do
        {
          poker_session: {
            name: "",
            estimates: "estimates",
            password: "password",
            tasks_attributes: {
              "0": {description: "task1", _destroy: false},
              "1": {description: "task2", _destroy: false}
            }
          }
        }
      end

      it "does not create a new poker session" do
        expect { subject }.not_to change(PokerSession, :count)
      end

      it "redirects to the new poker session form" do
        subject
        expect(response).to redirect_to(new_poker_session_path)
      end

      it "sets a flash alert" do
        subject
        expect(flash[:alert]).to eq("Invalid")
      end
    end
  end
end
