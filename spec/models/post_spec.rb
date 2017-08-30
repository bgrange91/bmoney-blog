require 'spec_helper'

RSpec.describe Post, :type => :model do
  describe "Validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:body) }
  end

  describe "Associations" do
    it { should have_many(:comments) }
  end
end
