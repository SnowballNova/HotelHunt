require 'rails_helper'

RSpec.describe "RoomsController", type: :controller do
  render_views

  let(:room) { create :room }
  let(:user) { create :user }
  before(:each) do
    self.controller = RoomsController.new
    sign_in user
  end

  context "GET index" do
    it "responds with 200 HTTP code" do
      get :index
      expect(response).to have_http_status(200)
    end

    it "contains links to access rooms show pages" do
      path = room_path(room)
      get :index
      page_links = Nokogiri::HTML(response.body).search('a').map { |element| element.attributes["href"].value }
      expect(page_links).to include path
    end
  end

  context "GET show" do
    it "responds with 200 HTTP code" do
      get :show, params: { id: room.id }
      expect(response).to have_http_status(200)
    end

    it "contains a link to access rooms index" do
      get :show, params: { id: room.id }
      page_links = Nokogiri::HTML(response.body).search('a').map { |element| element.attributes["href"].value }
      expect(page_links).to include rooms_path

      second_room = create(:room)
      get :show, params: { id: second_room.id }
      page_links = Nokogiri::HTML(response.body).search('a').map { |element| element.attributes["href"].value }
      expect(page_links).to include rooms_path
    end

    it "contains a form to create a booking" do
      get :show, params: { id: room.id }
      form_actions = Nokogiri::HTML(response.body).search('form').map { |element| element.attributes["action"].value }
      expect(form_actions).to include room_bookings_path(room)
    end
  end
end
