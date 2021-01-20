require 'rails_helper'

RSpec.describe "intakes/index", type: :view do
  before(:each) do
    assign(:intakes, [
      Intake.create!(
        name: "Name",
        email: "Email",
        message: "MyText"
      ),
      Intake.create!(
        name: "Name",
        email: "Email",
        message: "MyText"
      )
    ])
  end

  it "renders a list of intakes" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "Email".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
  end
end
