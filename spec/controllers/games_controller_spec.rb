require 'rails_helper'

RSpec.describe GamesController, type: :controller do
  describe "GET #new" do
    it "assigns a new game to @game" do
      get :new
      expect(assigns(:game)).to be_a_new(Game)
    end

    it "renders the new template" do
      get :new
      expect(response).to render_template :new
    end
  end
end
