describe Licenses do
  describe 'VERSION' do
    subject { Licenses::VERSION }

    example 'it should be set' do
      expect(subject).not_to be_nil
    end

    example 'it should be frozen' do
      expect(subject).to be_frozen
    end
  end

  describe '#path' do
    subject { Licenses.path }

    example 'it should return correctly' do
      expect(subject.to_s).to eq(File.expand_path(File.join(%w(.. .. ..)), __FILE__))
    end
  end
end
