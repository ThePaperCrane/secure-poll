class Poll < ActiveRecord::Base
  attr_accessible :option_a, :option_a_score, :option_b, :option_b_score, :option_c, :option_c_score, :option_d, :option_d_score, :question
  
  validates_presence_of :question, :option_a, :option_b
end
