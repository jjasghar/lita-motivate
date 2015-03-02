require "spec_helper"

describe Lita::Handlers::Motivate, lita_handler: true do

  it { pending; is_expected.to route("!h5 billy").to(:high_five) }
  it { pending; is_expected.to route("^5 billy").to(:high_five) }
  it { is_expected.to route("!m billy").to(:motivate) }
  it { is_expected.to route("!thank billy").to(:motivate) }
  it { is_expected.to route("!thanks billy").to(:motivate) }

  it "should say high_five to billy" do
    pending
    user1 = Lita::User.create(123, name: "user1")
    user2 = Lita::User.create(456, name: "user2")
    send_message("!h5 user2", as: user1)
    expect(replies.last).to eq("#{robot.name} high fives #{user2.name}")
  end

  it "should say motivate to billy" do
    user1 = Lita::User.create(123, name: "user1")
    user2 = Lita::User.create(456, name: "user2")
    send_message("!m user2", as: user1)
    expect(replies.last).to eq("#{user2.name} keep up the good work!")
  end

end
