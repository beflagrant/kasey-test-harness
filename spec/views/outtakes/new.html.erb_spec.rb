require 'rails_helper'

RSpec.describe "outtakes/new", type: :view do
  before(:each) do
    assign(:outtake, Outtake.new(
      full_name: "MyString",
      email: 'test@email.com',
      n_decimal: "9.99",
      n_float: 1.5,
      n_integer: 1,
      is_ok: false,
      note: "MyText"
    ))
  end

  it "renders new outtake form" do
    render

    assert_select "form[action=?][method=?]", outtakes_path, "post" do

      assert_select "input[name=?]", "outtake[full_name]"

      assert_select "input[name=?]", "outtake[n_decimal]"

      assert_select "input[name=?]", "outtake[n_float]"

      assert_select "input[name=?]", "outtake[n_integer]"

      assert_select "input[name=?]", "outtake[is_ok]"

      assert_select "textarea[name=?]", "outtake[note]"
    end
  end
end
