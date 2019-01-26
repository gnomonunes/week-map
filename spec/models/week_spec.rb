require 'rails_helper'

RSpec.describe Week, type: :model do
  it { should have_many(:goals).dependent(:destroy) }
end
