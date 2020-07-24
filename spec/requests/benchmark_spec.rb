 require 'rails_helper'

RSpec.describe 'serializer benchmarks' do
  describe "GET /index" do
    it "renders a successful response" do
      get posts_url

      expect(response).to be_successful
    end
  end
end
