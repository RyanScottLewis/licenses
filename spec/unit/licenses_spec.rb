describe Licenses do
  describe 'VERSION' do
    subject { Licenses::VERSION }

    it { should_not be_nil }
  end

  describe '#path' do
    subject { Licenses.path.to_s }

    it { should eq(File.expand_path(File.join(%w(.. .. ..)), __FILE__)) }
  end
end
