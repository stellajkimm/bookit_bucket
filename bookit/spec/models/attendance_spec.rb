require 'rails_helper'

RSpec.describe Attendance, :type => :model do
  context "associations" do
  	it { should belong_to(:item) }
  	it { should belong_to(:user) }
  end
end
