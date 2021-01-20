require 'rails_helper'

RSpec.describe "outtakes/show", type: :view do
  before(:each) do
    @outtake = assign(:outtake, Outtake.create!(
      full_name: "Full Name",
      email: 'test@example.com',
      n_decimal: "9.99",
      n_float: 2.5,
      n_integer: 3,
      is_ok: false,
      note: "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Full Name/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/2.5/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/MyText/)
  end
end
