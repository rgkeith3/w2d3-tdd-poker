require "tdd"

describe "Array#my_uniq" do
  it "Removes duplicates" do
    expect([1,2,1,3,3].my_uniq).to eq([1,2,3])
  end
end

describe "Array#two_sum" do
  it "Returns all pairs of pos where elements at those positions == 0" do
    expect([-1, 0, 2, -2, 1].two_sum).to eq([[0, 4], [2, 3]])
  end
end

describe "Array#my_transpose" do
  it "Transposes matrix correctly" do
    expect([
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8]
  ].my_transpose).to eq(
    [[0, 3, 6],
    [1, 4, 7],
    [2, 5, 8]])
  end
end

describe "Array#stock_picker" do
  it "Correctly outputs correct days" do
    expect([5,2,4,1,6,3,8].stock_picker).to eq([3,6])
  end
end
