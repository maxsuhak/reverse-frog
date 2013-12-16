require_relative 'recursive_reverse.rb'
require 'rspec'

describe Array do
  let(:array) { (1..5).to_a }
  let(:rev) { array.reverse }
  it 'recursive_reverse' do
    array.recursive_reverse == rev
  end
end
