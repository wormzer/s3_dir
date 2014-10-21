if defined?(ChefSpec)
  ChefSpec.define_matcher :s3_dir

  def create_s3_dir(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:s3_dir, :create, resource_name)
  end
end
