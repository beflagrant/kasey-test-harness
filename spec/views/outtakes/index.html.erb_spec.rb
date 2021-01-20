require 'rails_helper'

RSpec.describe "outtakes/index", type: :view do
  before(:each) do
    assign(:outtakes, [
      Outtake.create!(
        full_name: "Full Name",
        email: 'test@email.com',
        n_decimal: "9.99",
        n_float: 2.5,
        n_integer: 3,
        is_ok: false,
        note: "MyText"
      ),
      Outtake.create!(
        full_name: "Full Name",
        email: 'other@email.com',
        n_decimal: "9.99",
        n_float: 2.5,
        n_integer: 3,
        is_ok: false,
        note: "MyText"
      )
    ])
  end

  it "renders a list of outtakes" do
    render
    assert_select "tr>td", text: "Full Name".to_s, count: 2
    assert_select "tr>td", text: "9.99".to_s, count: 2
    assert_select "tr>td", text: 2.5.to_s, count: 2
    assert_select "tr>td", text: 3.to_s, count: 2
    assert_select "tr>td", text: false.to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
  end
end
