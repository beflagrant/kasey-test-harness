require 'rails_helper'

RSpec.describe "intakes/edit", type: :view do
  before(:each) do
    @intake = assign(:intake, Intake.create!(
      name: "MyString",
      email: "MyString",
      message: "MyText"
    ))
  end

  it "renders the edit intake form" do
    render

    assert_select "form[action=?][method=?]", intake_path(@intake), "post" do

      assert_select "input[name=?]", "intake[name]"

      assert_select "input[name=?]", "intake[email]"

      assert_select "textarea[name=?]", "intake[message]"
    end
  end
end
