require 'rails_helper'

RSpec.describe "outtakes/edit", type: :view do
  before(:each) do
    @outtake = assign(:outtake, Outtake.create!(
      full_name: "MyString",
      email: 'test@email.com',
      n_decimal: "9.99",
      n_float: 1.5,
      n_integer: 1,
      is_ok: false,
      note: "MyText"
    ))
  end

  it "renders the edit outtake form" do
    render

    assert_select "form[action=?][method=?]", outtake_path(@outtake), "post" do

      assert_select "input[name=?]", "outtake[full_name]"

      assert_select "input[name=?]", "outtake[n_decimal]"

      assert_select "input[name=?]", "outtake[n_float]"

      assert_select "input[name=?]", "outtake[n_integer]"

      assert_select "input[name=?]", "outtake[is_ok]"

      assert_select "textarea[name=?]", "outtake[note]"
    end
  end
end
