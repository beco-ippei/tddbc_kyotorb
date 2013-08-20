require 'vender'

describe 'tddbc' do
  before do
    @vender = Vender.new
  end

  describe '#insert' do
    subject {@vender.insert}
    [10, 50, 100, 500, 1000].each do |fee|
      it "not expect error on #{fee}" do
        expect { fee }.not_to raise_error
      end
    end

    it 'insert any times ' do
      3.times.each do
        expect { 10 }.not_to raise_error
      end
    end
  end

  describe '#total' do
    it 'can calcurate total charge' do

      @vender.insert 10
      @vender.insert 10
      @vender.insert 100

      expect(@vender.total).to eq 120
    end
  end

  describe '#pay_back' do
    it 'return ...' do

      @vender.insert 10
      @vender.insert 10
      @vender.insert 100

      expect(@vender.pay_back).to eq 120
    end
  end
end
