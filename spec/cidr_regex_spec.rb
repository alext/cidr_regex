require 'spec_helper'

describe CIDRRegex do

  describe "with subnets on octet boundaries" do
    it "should generate a correct regex with a /8 subnet" do
      str = CIDRRegex.generate('10.0.0.0/8')
      str.should == '^10\.'
    end

    it "should generate a correct regex with a /16 subnet" do
      str = CIDRRegex.generate('10.11.0.0/16')
      str.should == '^10\.11\.'
    end

    it "should generate a correct regex with a /24 subnet" do
      str = CIDRRegex.generate('10.11.12.0/24')
      str.should == '^10\.11\.12\.'
    end
  end
end
