class Rsakey < ActiveRecord::Base
  attr_accessible :marshkey, :userid
  validates_presence_of :marshkey, :userid
  
  def pub_key_mod
    keypair = Marshal.load(self.marshkey)
    keypair.public_key.modulus
  end
  
  def pub_key_exp
    keypair = Marshal.load(self.marshkey)
    keypair.public_key.exponent
  end
end
