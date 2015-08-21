require "spec_helper"

describe Lita::Handlers::HighFive, lita_handler: true do
  it { is_expected.to route_command("o/").to(:high_five) }
  it { is_expected.to route_command("\\o").to(:inverse_high_five) }

  describe "#high_five" do
    it "high fives you back" do
      send_command("o/")
      expect(replies.last).to include("\\o")
    end
  end

  describe "#inverse_high_five" do
    it "high fives you back" do
      send_command("\\o")
      expect(replies.last).to include("o/")
    end
  end
end
