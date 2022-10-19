require 'rails_helper'

RSpec.describe "Lots", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get "/lots/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/lots/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/lots/show"
      expect(response).to have_http_status(:success)
    end
  end

end
