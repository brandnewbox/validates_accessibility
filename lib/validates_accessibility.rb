require 'active_support/concern'
require 'active_support/core_ext/module'
require 'active_support/core_ext/hash/except'
require 'active_support/core_ext/string/conversions'
require 'active_support/core_ext/date/acts_like'
require 'active_support/core_ext/date/conversions'
require 'active_support/core_ext/time/acts_like'
require 'active_support/core_ext/time/conversions'
require 'active_support/core_ext/date_time/acts_like'
require 'active_support/core_ext/date_time/conversions'

module ValidatesAccessibility
  autoload :VERSION, 'validates_accessibility/version'
end

# require 'validates_accessibility/conversion'
require 'validates_accessibility/validator'
require 'validates_accessibility/helper_methods'
# require 'validates_accessibility/attribute_methods'
# require 'validates_accessibility/extensions'
require 'validates_accessibility/railtie' if defined?(Rails)