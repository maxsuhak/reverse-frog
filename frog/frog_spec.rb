require_relative 'frog.rb'
require 'rspec'

describe Array do

  let(:hash) { {0=>1, 1=>3, 2=>1, 3=>4, 4=>2, 5=>3, 6=>5, 7=>4} }
  let(:not_valid_hash) { (1..100_001).each_with_index { |h, i| not_valid_hash[i] = h } }
  let(:empty_hash) { {} }
  let(:x) { 5 }
  let(:not_valid_x) { 100_001 }

  context 'with ivalid attrebutes' do
    it 'should raise if value is not hash' do
      lambda { Frog.crossing(x, :not_a_hash) }.should raise_error
    end

    it 'should raise if value is not int' do
      lambda { Frog.crossing(:not_a_integer, hash) }.should raise_error
    end

    it 'is not valid when x more than 100_000' do
      lambda { Frog.crossing(not_valid_x, hash) }.should raise_error
    end

    it 'is not valid when hash more than 100_000' do
      lambda { Frog.crossing(x, not_valid_hash) }.should raise_error
    end

    it 'is not valid when hash is empty' do
      lambda { Frog.crossing(x, empty_hash) }.should raise_error
    end
  end

  context 'with valid attrebutes' do
    it 'should find the lowest time as in example' do
      Frog.crossing(x, hash).should eq(6)
    end

    it 'is return 2' do
      a = {0=>1, 1=>2, 2=>3}
      Frog.crossing(3, a).should eq(2)
    end

    it 'is return 4' do
      a = {0=>1, 1=>24, 2=>3, 3=>2, 4=>3}
      Frog.crossing(3, a).should eq(3)
    end

    it 'x is not match' do
      a = {0=>1, 1=>2, 2=>4, 3=>5}
      Frog.crossing(3, a).should eq(-1)
    end
    
    it 'is return -1' do
      Frog.crossing(6, hash).should eq(-1)
    end
  end

end