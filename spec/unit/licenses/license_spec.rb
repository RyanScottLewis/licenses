require 'support/license_helpers'

describe Licenses::License do
  include LicenseHelpers

  describe '.all' do
    subject { described_class.all }

    example 'it should return correctly' do
      expect(subject).to eq([])
    end

    example 'it should be frozen' do
      expect(subject).to be_frozen
    end
  end

  describe '.register' do
    let(:license) { build_license }

    before { described_class.register(license) }

    example 'it should register the license' do
      expect(described_class.all).to eq([license])
    end
  end

  describe '.find' do
    subject { described_class }

    context do
      let(:license_1) do
        build_license(
          name:      'Test License 1',
          shortname: :tl1,
          url:       'https://example.org/license-1.txt',
          template:  'tl1_template'
        )
      end

      let(:license_2) do
        build_license(
          name:     'Simple License 2.0',
          url:      'https://example.org/simple-license-2.0.txt',
          template: 'sl20'
        )
      end

      let(:license_3) do
        build_license(
          name:      'Example Commercial',
          shortname: :excom,
          url:       'https://example.com/license.md'
        )
      end

      let(:license_4) do
        build_license(
          name: 'Another Commercial',
          url:  'https://example.com/another.md'
        )
      end

      before do
        described_class.register(license_1)
        described_class.register(license_2)
        described_class.register(license_3)
        described_class.register(license_4)
      end

      example 'it should find a license by the given attributes in the order they were given' do
        expect(subject.find).to eq(nil)

        expect(subject.find(name: 'Test License 1')).to eq(license_1)
        expect(subject.find(name: /License 1/)).to eq(license_1)
        expect(subject.find(shortname: :tl1)).to eq(license_1)
        expect(subject.find(shortname: /tl/)).to eq(license_1)
        expect(subject.find(url: 'https://example.org/license-1.txt')).to eq(license_1)
        expect(subject.find(url: /license-1.txt/)).to eq(license_1)
        expect(subject.find(template: 'tl1_template')).to eq(license_1)
        expect(subject.find(template: /tl1/)).to eq(license_1)

        expect(subject.find(name: 'Simple License 2.0')).to eq(license_2)
        expect(subject.find(name: /License 2/)).to eq(license_2)
        expect(subject.find(shortname: :simple_license_2_0)).to eq(license_2)
        expect(subject.find(shortname: /simple_license/)).to eq(license_2)
        expect(subject.find(url: 'https://example.org/simple-license-2.0.txt')).to eq(license_2)
        expect(subject.find(url: /2\.0/)).to eq(license_2)
        expect(subject.find(template: 'sl20')).to eq(license_2)
        expect(subject.find(template: /sl2/)).to eq(license_2)

        expect(subject.find(name: 'Example Commercial')).to eq(license_3)
        expect(subject.find(name: /Commercial/)).to eq(license_3)
        expect(subject.find(shortname: :excom)).to eq(license_3)
        expect(subject.find(shortname: /com/)).to eq(license_3)
        expect(subject.find(url: 'https://example.com/license.md')).to eq(license_3)
        expect(subject.find(url: /example\.com/)).to eq(license_3)
        expect(subject.find(template: :excom)).to eq(license_3)
        expect(subject.find(template: /com/)).to eq(license_3)

        expect(subject.find(name: 'Another Commercial')).to eq(license_4)
        expect(subject.find(name: /Anoth/)).to eq(license_4)
        expect(subject.find(shortname: :another_commercial)).to eq(license_4)
        expect(subject.find(shortname: /another/)).to eq(license_4)
        expect(subject.find(url: 'https://example.com/another.md')).to eq(license_4)
        expect(subject.find(url: /another/)).to eq(license_4)
        expect(subject.find(template: :another_commercial)).to eq(license_4)
        expect(subject.find(template: /another/)).to eq(license_4)
      end
    end

    example 'it should be aliased as #[]' do
      expect(subject.method(:find) == subject.method(:[]))
    end
  end

  describe '#initialize' do
    context 'when a name is given' do
      example 'then it should not raise an error' do
        expect { build_license }.not_to raise_error
      end
    end

    context 'when a name is not given' do
      example 'then it hould raise an error' do
        expect { build_license(name: nil) }.to raise_error(ArgumentError)
      end
    end
  end

  describe '#name' do
    subject { build_license.name }

    example 'it should return correctly' do
      should eq('Test License')
    end
  end

  describe '#name=' do
    subject { build_license }

    example 'it should set correctly' do
      subject.name = 'My License'

      expect(subject.name).to eq('My License')
    end

    context 'when the value is surrounded spaces' do
      example 'then it should be stripped' do
        subject.name = '   My License  '

        expect(subject.name).to eq('My License')
      end

      context 'and it is empty after stripping' do
        example 'then it should be raise an error' do
          expect { subject.name = "   \r  \n  \x0 \r\n " }.to raise_error(ArgumentError)
        end
      end
    end
  end

  describe '#shortname' do
    context 'when a shortname is set' do
      subject { build_license(shortname: :tl).shortname }

      example 'then it should return correctly' do
        should eq(:tl)
      end
    end

    context 'when a shortname is unset' do
      subject { build_license.shortname }

      example 'then it should be generated from the name' do
        should eq(:test_license)
      end
    end
  end

  describe '#shortname=' do
    subject { build_license }

    example 'it should set correctly' do
      subject.shortname = 'Awesome License'
      expect(subject.shortname).to eq(:awesome_license)

      subject.shortname = :" Foobar my_license WowWhee"
      expect(subject.shortname).to eq(:foobar_my_license_wow_whee)
    end
  end

  describe '#url' do
    subject { build_license.url }

    example 'it should return correctly' do
      should eq(nil)
    end
  end

  describe '#url=' do
    subject { build_license }

    example 'then it should set correctly' do
      subject.url = 'https://example.org/license.txt'
      expectation = URI.parse('https://example.org/license.txt')

      expect(subject.url).to eq(expectation)
    end
  end

  describe '#template' do
    context 'when a template is set' do
      subject { build_license(template: :tl).template }

      example 'then it should return correctly' do
        should eq('tl')
      end
    end

    context 'when a template is unset' do
      subject { build_license }

      example 'then it should be generated from the shortname' do
        expect(subject.template).to eq('test_license')
        subject.shortname = :awesome_license
        expect(subject.template).to eq('awesome_license')
      end
    end
  end

  describe '#template=' do
    subject { build_license }

    example 'it should set correctly' do
      subject.template = 'Awesome License'
      expect(subject.template).to eq('awesome_license')

      subject.template = :" Foobar my_license WowWhee"
      expect(subject.template).to eq('foobar_my_license_wow_whee')
    end
  end

  describe '#matches?' do
    pending 'it should return whether the given attributes matches the license'
  end
end
