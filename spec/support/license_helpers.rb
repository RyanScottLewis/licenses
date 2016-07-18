def valid_license(attributes = {})
  attributes = { name: 'Test License' }.merge(attributes)

  described_class.new(attributes)
end
