require 'rails_helper'

RSpec.describe "Performances", type: :request do
  describe "GET /performances" do
    it "works! (now write some real specs)" do
      get performances_path
      expect(response).to have_http_status(200)
    end
  end
end
