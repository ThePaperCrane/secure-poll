require 'spec_helper'

describe "polls/edit" do
  before(:each) do
    @poll = assign(:poll, stub_model(Poll,
      :question => "MyText",
      :option_a => "MyText",
      :option_a_score => 1,
      :option_b => "MyText",
      :option_b_score => 1,
      :option_c => "MyText",
      :option_c_score => 1,
      :option_d => "MyText",
      :option_d_score => 1
    ))
  end

  it "renders the edit poll form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => polls_path(@poll), :method => "post" do
      assert_select "textarea#poll_question", :name => "poll[question]"
      assert_select "textarea#poll_option_a", :name => "poll[option_a]"
      assert_select "input#poll_option_a_score", :name => "poll[option_a_score]"
      assert_select "textarea#poll_option_b", :name => "poll[option_b]"
      assert_select "input#poll_option_b_score", :name => "poll[option_b_score]"
      assert_select "textarea#poll_option_c", :name => "poll[option_c]"
      assert_select "input#poll_option_c_score", :name => "poll[option_c_score]"
      assert_select "textarea#poll_option_d", :name => "poll[option_d]"
      assert_select "input#poll_option_d_score", :name => "poll[option_d_score]"
    end
  end
end
