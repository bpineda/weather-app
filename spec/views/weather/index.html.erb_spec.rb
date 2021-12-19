require 'rails_helper'

RSpec.describe "weather/index", type: :view do
  # pending "add some examples to (or delete) #{__FILE__}"
  it "displays correct labels" do
      render :template => "weather/index"

      expect(rendered).to match /WeatherApp/
      expect(rendered).to match /Enter an address/
      expect(rendered).to_not match /City/
  end
end
