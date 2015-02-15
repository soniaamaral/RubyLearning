require 'sort'

describe :bubble_sort do
  it "should return an empty output for an empty input" do
    expect(bubble_sort([])).to be_empty
  end
  it "should return the same array as input for one element input" do
    expect(bubble_sort([1])).to eq [1]
  end
end
