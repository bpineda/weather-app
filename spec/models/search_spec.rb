require 'rails_helper'

RSpec.describe Search, type: :model do
  it "is valid without a zip code" do
    search_cache = Search.new(query: "1 Apple Park Way Cupertino, California, 95014-0642 United States")
    expect(search_cache).to be_valid
  end
end
