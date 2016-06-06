require 'rails_helper'

RSpec.describe Link, type: :model do
  it "validates urls" do
    link1 = Link.create(title: "hey", url: "http://google.com")
    expect(link1.valid?).to be true
    link2 = Link.create(title: "hey", url: "poop")
    expect(link2.valid?).to be false
  end
end
