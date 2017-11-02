module ValidatesAccessibility
  module Generators
    class InstallGenerator < Rails::Generators::Base
      desc "Copy ValidatesAccessibility default files"
      source_root File.expand_path('../templates', __FILE__)

      def copy_initializers
        copy_file 'validates_accessibility.rb', 'config/initializers/validates_accessibility.rb'
      end

      def copy_locale_file
        copy_file 'en.yml', 'config/locales/validates_accessibility.en.yml'
      end
    end
  end
end