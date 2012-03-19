require 'spec_helper'

describe CIDRRegex do

  describe "with subnets on octet boundaries" do
    it "should generate a correct regex with a /8 subnet" do
      str = CIDRRegex.generate('10.0.0.0/8')
      str.should == '^10\.'
      r = Regexp.new(str)
      r.match('10.0.0.0').should_not be_nil
      r.match('10.143.242.1').should_not be_nil
      r.match('10.255.255.255').should_not be_nil
      r.match('11.0.0.0').should be_nil
      r.match('100.0.0.0').should be_nil
    end

    it "should generate a correct regex with a /16 subnet" do
      str = CIDRRegex.generate('10.11.0.0/16')
      str.should == '^10\.11\.'
      r = Regexp.new(str)
      r.match('10.11.0.0').should_not be_nil
      r.match('10.11.23.143').should_not be_nil
      r.match('10.11.255.255').should_not be_nil
      r.match('10.10.0.0').should be_nil
      r.match('10.100.0.0').should be_nil
      r.match('10.12.0.0').should be_nil
      r.match('11.11.23.143').should be_nil
    end

    it "should generate a correct regex with a /24 subnet" do
      str = CIDRRegex.generate('10.11.12.0/24')
      str.should == '^10\.11\.12\.'
      r = Regexp.new(str)
      r.match('10.11.12.0').should_not be_nil
      r.match('10.11.12.143').should_not be_nil
      r.match('10.11.12.255').should_not be_nil
      r.match('10.11.11.0').should be_nil
      r.match('10.11.14.0').should be_nil
      r.match('11.11.12.0').should be_nil
      r.match('10.110.12.0').should be_nil
    end
  end
end
