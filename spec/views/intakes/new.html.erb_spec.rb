require 'rails_helper'

RSpec.describe "intakes/new", type: :view do
  before(:each) do
    assign(:intake, Intake.new(
      name: "MyString",
      email: "MyString",
      message: "MyText"
    ))
  end

  it "renders new intake form" do
    render

    assert_select "form[action=?][method=?]", intakes_path, "post" do

      assert_select "input[name=?]", "intake[name]"

      assert_select "input[name=?]", "intake[email]"

      assert_select "textarea[name=?]", "intake[message]"
    end
  end
end
