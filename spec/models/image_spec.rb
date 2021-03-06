require 'rails_helper'

describe Image do
  it { should belong_to :user }
  it { should have_many :comments }
  it { should have_many :tags }
end
