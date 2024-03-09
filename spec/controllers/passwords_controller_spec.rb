require "rails_helper"

RSpec.describe PasswordsController, type: :controller do
  let(:current_user) { create(:user) }

  before { allow(controller).to receive(:current_user).and_return(current_user) }

  describe "GET #new" do
    it "renders the new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe "PATCH #update" do
    context "with valid parameters" do
      let(:params) do
        {
          password: {
            old_password: "123",
            new_password: "new_password",
            new_password_confirmation: "new_password"
          }
        }
      end

      it "changes the user password" do
        patch :update, params: params
        expect(current_user.authenticate("new_password")).to be_truthy
      end

      it "redirects to the user path" do
        patch :update, params: params
        expect(response).to redirect_to(user_path)
      end
    end

    context "with invalid parameters" do
      let(:params) do
        {
          password: {
            old_password: "wrong_password",
            new_password: "new_password",
            new_password_confirmation: "new_password"
          }
        }
      end

      it "renders the new template" do
        patch :update, params: params
        expect(response).to render_template(:new)
      end
    end
  end

  describe "POST #validate" do
    subject { post :validate, params:, format: :turbo_stream }

    context "with valid params" do
      let(:params) do
        {
          password: {
            old_password: "123",
            new_password: "new_password",
            new_password_confirmation: "new_password"
          }
        }
      end

      it "renders turbo stream" do
        subject
        expect(response).to have_http_status(:success)
        expect(response.content_type).to eq("text/vnd.turbo-stream.html; charset=utf-8")
      end

      it "sets @password to be valid" do
        subject
        expect(assigns(:password).valid?).to be_truthy
      end
    end

    context "with invalid params" do
      let(:params) do
        {
          password: {
            old_password: "wrong_password",
            new_password: "new_password",
            new_password_confirmation: "new_password"
          }
        }
      end

      it "renders turbo stream" do
        subject
        expect(response).to have_http_status(:success)
        expect(response.content_type).to eq("text/vnd.turbo-stream.html; charset=utf-8")
      end

      it "sets @password to be invalid" do
        subject
        expect(assigns(:password).invalid?).to be_truthy
      end
    end
  end
end
