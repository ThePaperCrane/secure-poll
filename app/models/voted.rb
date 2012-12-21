class Voted < ActiveRecord::Base
  attr_accessible :pollid, :userid
  validates_presence_of :pollid, :userid
end
