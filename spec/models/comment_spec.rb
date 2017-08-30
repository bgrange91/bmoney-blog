require 'spec_helper'

RSpec.describe Comment, :type => :model do
  describe "Validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:body) }
  end

  describe "Associations" do
    it { should belong_to(:post) }
  end
end
