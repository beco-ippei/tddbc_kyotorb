require 'vender'

def money_varieties
  [10, 50, 100, 500, 1000]
end

describe Vender do
  let(:vender) { Vender.new }

  #XXX may be, this case is not nessesary.
  it { expect(vender.instance_variable_get :@charge).to eq 0 }

  describe '#insert' do
    subject { vender.insert }

    money_varieties.each do |fee|
      context "when #{fee}yen" do
        it { expect { fee }.not_to raise_error }
      end
    end

    it 'can any times' do
      3.times.each do
        expect { 10 }.not_to raise_error
      end
    end
  end

  shared_examples_for 'insert money variations' do
    before do
      moneis.each {|fee| vender.insert fee }
    end
    let(:total) { moneis.inject {|sum, i| sum+=i } }

    context 'when insert all type and once' do
      let!(:moneis) { money_varieties }
      it { should eq total }
    end

    money_varieties.reverse.each_with_index do |fee, idx|
      context "when insert #{fee}yen #{idx} times" do
        let!(:moneis) { Array.new idx, fee }
        it { should eq fee*idx }
      end
    end
  end

  describe '#total' do
    it_behaves_like 'insert money variations' do
      subject { vender.total }
    end
  end

  describe '#pay_back' do
    it_behaves_like 'insert money variations' do
      subject { vender.pay_back }
    end
  end
end
