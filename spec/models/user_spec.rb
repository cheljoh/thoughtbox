require 'rails_helper'

RSpec.describe User, type: :model do
  it "has a unique email" do
    user1 = User.create(email: "hello@cool.com", password: "hello", password_confirmation: "hello")
    expect(user1.valid?).to be true
    user2 = User.create(email: "hello@cool.com", password: "hello", password_confirmation: "hello")
    expect(user2.valid?).to be false
  end

  it "confirms password and password confirmation" do
    user1 = User.create(email: "hello@cool.com", password: "hello", password_confirmation: "yo")
    expect(user1.valid?).to be false
    user2 = User.create(email: "hello@cool.com", password: "hello", password_confirmation: "hello")
    expect(user2.valid?).to be true
  end
end
