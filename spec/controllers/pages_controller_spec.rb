require 'rails_helper'

RSpec.describe "PagesController", type: :controller do
  render_views

  before(:each) do
    self.controller = PagesController.new
  end

  context "GET home" do
    it "responds with 200 HTTP code" do
      get :home
      expect(response).to have_http_status(200)
    end

    it "contains a link to access to rooms#index" do
      get :home
      page_links = Nokogiri::HTML(response.body).search('a').map { |element| element.attributes["href"].value }
      expect(page_links).to include rooms_path
    end
  end
end
