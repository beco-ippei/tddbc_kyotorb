require 'tddbc'

describe 'tddbc' do

  [10, 50, 100, 500, 1000].each do |fee|
    it "not expect error on #{fee}" do
      vender = Vender.new
      expect { vender.insert fee }.not_to raise_error
    end
  end

  it 'insert any times ' do
    vender = Vender.new
    3.times.each do
      expect { vender.insert 10 }.not_to raise_error
    end
  end

  it 'can calcurate total charge' do
    vender = Vender.new

    vender.insert 10
    vender.insert 10
    vender.insert 100

    expect(vender.total).to eq 120
  end

  it 'return ...' do
    vender = Vender.new

    vender.insert 10
    vender.insert 10
    vender.insert 100

    expect(vender.pay_back).to eq 120
  end
end
