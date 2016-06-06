require "rails_helper"

RSpec.describe "IdeaEndpointsSpec", type: :request do

  it "returns all ideas" do

    user = User.create(email: "hi@example.com", password: "hello", password_confirmation: "hello")
    visit "/"

    fill_in "Email", with: "hi@example.com"
    fill_in "Password", with: "hello"
    click_button "Login!"

    link1 = Link.create(title: "hey", url: "http://google.com")
    link2 = Link.create(title: "whooo", url: "http://yahoo.com")
    link1 = Link.first
    link2 = Link.last

    get "/api/v1/links"

    results = JSON.parse(response.body)

    expect(response.content_type).to eq("application/json")
    expect(response).to be_success

    expect(results.count).to eq(Link.count)
    expect(results.first["title"]).to eq(link1.title)
    expect(results.first["url"]).to eq(link1.url)
    expect(results.last["title"]).to eq(link2.title)
    expect(results.last["url"]).to eq(link2.url)
  end

  # it "can create a new idea" do
  #   make_ideas
  #
  #   expect(Idea.count).to eq(5)
  #
  #   post "/api/v1/ideas", {idea: {title: "hello", body: "whatsup"}}
  #
  #   results = JSON.parse(response.body)
  #
  #   expect(response.content_type).to eq("application/json")
  #   expect(response).to be_success
  #
  #   new_idea = Idea.last
  #
  #   expect(Idea.count).to eq(6)
  #
  #   expect(new_idea.title).to eq("hello")
  #   expect(new_idea.body).to eq("whatsup")
  # end
  #
  # it "new idea must have a title and body" do
  #   make_ideas
  #
  #   expect(Idea.count).to eq(5)
  #
  #   post "/api/v1/ideas", {idea: {title: "hello"}}
  #
  #   results = JSON.parse(response.body)
  #
  #   expect(response.content_type).to eq("application/json")
  #   expect(response.status).to eq(422)
  #   expect(results["errors"]["body"][0]).to eq("can't be blank")
  # end
  #
  # it "can delete an idea" do
  #   make_ideas
  #
  #   idea = Idea.first
  #
  #   expect(Idea.count).to eq(5)
  #
  #   delete "/api/v1/ideas/#{idea.id}"
  #
  #   expect(Idea.count).to eq(4)
  # end
  #
  # it "can change quality of an idea" do
  #   make_ideas
  #
  #   expect(Idea.first.quality).to eq("swill")
  #
  #   put "/api/v1/ideas/#{Idea.first.id}", {idea: {quality: "plausible"}}
  #
  #   expect(Idea.first.quality).to eq("plausible")
  # end
  #
  # it "can edit an idea" do
  #   make_ideas
  #
  #   expect(Idea.first.title).to eq("hello")
  #
  #   put "/api/v1/ideas/#{Idea.first.id}", {idea: {title: "this is a new title"}}
  #
  #   expect(Idea.first.title).to eq("this is a new title")
  # end
  #
  # it "must have title" do
  #   make_ideas
  #
  #   expect(Idea.first.title).to eq("hello")
  #
  #   put "/api/v1/ideas/#{Idea.first.id}", {idea: {title: ""}}
  #
  #   expect(Idea.first.title).to eq("hello")
  # end
end
