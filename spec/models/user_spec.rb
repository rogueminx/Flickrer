require 'rails_helper'

describe User do
  it { should have_many :images }
  it { should have_many :comments }
  it { should have_many :tags }
end
