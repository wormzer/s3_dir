actions :create

attribute :name,              kind_of: String, name_attribute: true
attribute :owner,             kind_of: [String, NilClass],          default: nil
attribute :group,             kind_of: [String, NilClass],          default: nil
attribute :mode,              kind_of: [String, Integer, NilClass], default: nil
attribute :bucket,            kind_of: String
attribute :dir,               kind_of: String,                      default: '/'
attribute :recursive,         kind_of: [TrueClass, FalseClass],     default: false
attribute :access_key_id,     kind_of: String
attribute :secret_access_key, kind_of: String

default_action :create
