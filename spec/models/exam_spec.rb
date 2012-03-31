require 'spec_helper'

describe Exam do

  context "new exam" do
    it "should have a title" do
      subject.should have_at_least(1).error_on(:title)
    end
    
    it "should have at least one question" do
      subject.should have_at_least(1).error_on(:base)
    end
  end

end