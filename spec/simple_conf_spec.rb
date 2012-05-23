require 'spec_helper'

class Configuration
  include SimpleConf
end

class Options
  include SimpleConf
end

describe SimpleConf do
  context "on include to config class generate properties" do
    it { Configuration.staging.domain.should == "staging.example.com" }

    it "should work properly with collections" do
      Configuration.staging.links.should == [
        "test1.example.com",
        "test2.example.com"
      ]
    end

    it { Configuration.production.domain.should == "production.example.com" }
  end
end

describe SimpleConf do
  context "on include to options class generate properties with only one key and value" do
    it { Options.domain.should == "example.com" }
  end
end
