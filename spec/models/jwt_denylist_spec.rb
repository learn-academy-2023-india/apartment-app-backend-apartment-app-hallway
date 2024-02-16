require 'rails_helper'

RSpec.describe JwtDenylist, type: :model do
  it 'is valid with necessary attributes' do
    denylist_entry = JwtDenylist.new(jti: "test_jti", exp: 1.week.from_now)
    expect(denylist_entry).to be_valid
  end
end