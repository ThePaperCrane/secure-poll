require 'spec_helper'

describe "polls/show" do
  before(:each) do
    @poll = assign(:poll, stub_model(Poll,
      :question => "MyText",
      :option_a => "MyText",
      :option_a_score => 1,
      :option_b => "MyText",
      :option_b_score => 2,
      :option_c => "MyText",
      :option_c_score => 3,
      :option_d => "MyText",
      :option_d_score => 4
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    rendered.should match(/MyText/)
    rendered.should match(/1/)
    rendered.should match(/MyText/)
    rendered.should match(/2/)
    rendered.should match(/MyText/)
    rendered.should match(/3/)
    rendered.should match(/MyText/)
    rendered.should match(/4/)
  end
end
