require 'simplecov'
SimpleCov.start

require 'methods.rb'

describe Wielomian do
  let(:wielomian) { Wielomian.new(0.001, [-2.0, 2.0]) }

  describe '#f(x)' do
    it 'should be defined' do
      expect { wielomian.f(1) }.not_to raise_error
    end
    it 'should count properly' do
      expect(wielomian.f(1)).to eq(-8)
      expect(wielomian.f(-1)).to eq(-12)
    end
  end

  describe '#fprime(x)' do
    it 'should be defined' do
      expect { wielomian.fprime(1) }.not_to raise_error
    end
    it 'should count properly' do
      expect(wielomian.fprime(1)).to eq(6)
      expect(wielomian.fprime(-1)).to eq(6)
    end
  end

  describe '#bisekcja' do
    it 'should be defined' do
      expect { wielomian.bisekcja }.not_to raise_error
    end
    before do
      wielomian.bisekcja
    end
    it 'should count properly' do
      expect(wielomian.bis).to be_between(1.53, 1.54).inclusive
    end
  end

  describe '#wybierz_przedzial' do
    it 'should be described' do
      expect { wielomian.wybierz_przedzial(1) }.not_to raise_error
    end
  end

  describe '#newton_raphson' do
    it 'should be described' do
      expect { wielomian.newton_raphson }.not_to raise_error
    end
    before do
      wielomian.newton_raphson
    end
    it 'should count properly' do
      expect(wielomian.newt).to be_between(1.53, 1.54).inclusive
    end
  end
end

describe Menu do
  let(:wielomian) { Wielomian.new(0.001, [-2.0, 2.0]) }
  let(:wielomian2) { Wielomian.new(0.5, [2.0, 2.0]) }
  let(:menu) { Menu.new }



  describe '#podaj_dokladnosc' do
    before do
      allow($stdout).to receive(:write) {}
    end
    it 'should be described' do
      allow(menu).to receive(:gets).and_return('0.001')
      expect { menu.podaj_dokladnosc }.not_to raise_error
    end
  end

  describe '#przedzial?' do
    before do
      allow($stdout).to receive(:write) {}
    end
    it 'should be described' do
      allow(menu).to receive(:gets).and_return('n')
      expect { menu.przedzial? }.not_to raise_error
    end
  end

  describe '#count' do
    it 'should be described' do
      expect { menu.count(wielomian) }.not_to raise_error
    end
    it 'should be described2' do
      expect { menu.count(wielomian2) }.not_to raise_error
    end
  end

  describe '#sprawdz_przedzial' do
    it 'should be described' do
      expect { menu.sprawdz_przedzial(-1,2) }.not_to raise_error
    end
    it 'should work properly' do
      expect { menu.sprawdz_przedzial(0,2) }.to raise_error
    end
  end


   # it 'should be described2' do
   #   allow(menu).to receive(:gets).and_return('2')
   #   expect { menu.podaj_dokladnosc }.not_to raise_error
   # end
  end

