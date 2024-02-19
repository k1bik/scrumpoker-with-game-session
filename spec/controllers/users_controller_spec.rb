require 'rails_helper'

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
    it "renders the show template" do
      get :show
      expect(response).to render_template :show
    end
  end
end
