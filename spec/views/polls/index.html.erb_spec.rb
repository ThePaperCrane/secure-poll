require 'spec_helper'

describe "polls/index" do
  before(:each) do
    assign(:polls, [
      stub_model(Poll,
        :question => "MyText",
        :option_a => "MyText",
        :option_a_score => 1,
        :option_b => "MyText",
        :option_b_score => 2,
        :option_c => "MyText",
        :option_c_score => 3,
        :option_d => "MyText",
        :option_d_score => 4
      ),
      stub_model(Poll,
        :question => "MyText",
        :option_a => "MyText",
        :option_a_score => 1,
        :option_b => "MyText",
        :option_b_score => 2,
        :option_c => "MyText",
        :option_c_score => 3,
        :option_d => "MyText",
        :option_d_score => 4
      )
    ])
  end

  it "renders a list of polls" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
  end
end
