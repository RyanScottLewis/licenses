module LicenseHelpers
  def build_license(attributes={})
    attributes = { name: 'Test License' }.merge(attributes.to_h)

    Licenses::License.new(attributes)
  end
end
