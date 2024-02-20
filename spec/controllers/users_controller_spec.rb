require "rails_helper"

RSpec.describe UsersController, type: :controller do
  describe "GET #new" do
    it "assigns a new user to @user" do
      get :new
      expect(assigns(:user)).to be_a_new(User)
    end

    it "renders the new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe "GET #show" do
    let(:user) { create(:user) }

    it "renders the show template" do
      get :show, session: {user_id: user.id}
      expect(response).to render_template :show
    end
  end

  describe "POST #create" do
    subject { post :create, params: }

    context "with valid params" do
      let(:params) do
        {
          user: {
            name: "name",
            password: "password",
            password_confirmation: "password"
          }
        }
      end

      it "creates a new user" do
        expect { subject }.to change(User, :count).by(1)
      end

      it "sets the user_id in session" do
        subject
        expect(session[:user_id]).to eq(User.last.id)
      end

      it "redirects to root path" do
        subject
        expect(response).to redirect_to(root_path)
      end
    end
  end
end
