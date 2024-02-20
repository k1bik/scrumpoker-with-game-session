require "rails_helper"

RSpec.describe SessionsController, type: :controller do
  describe "GET #new" do
    it "renders the new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe "POST #create" do
    context "with valid credentials" do
      let!(:user) { create(:user, password_digest: BCrypt::Password.create("password")) }

      it "sets the user_id in session" do
        post :create, params: {session: {name: user.name, password: "password"}}
        expect(session[:user_id]).to eq(user.id)
      end

      it "redirects to root path" do
        post :create, params: {session: {name: user.name, password: "password"}}
        expect(response).to redirect_to root_path
      end
    end

    context "with invalid credentials" do
      it "renders the new template" do
        post :create, params: {session: {name: "nonexistent_user", password: "wrong_password"}}
        expect(response).to render_template :new
      end

      it "assigns the name and sets invalid_password flag" do
        post :create, params: {session: {name: "nonexistent_user", password: "wrong_password"}}
        expect(assigns(:name)).to eq("nonexistent_user")
        expect(assigns(:invalid_password)).to be_truthy
      end
    end
  end

  describe "DELETE #destroy" do
    before { session[:user_id] = 1 }

    it "deletes user_id from session" do
      delete :destroy
      expect(session[:user_id]).to be_nil
    end

    it "redirects to new session path" do
      delete :destroy
      expect(response).to redirect_to new_session_path
    end
  end
end
