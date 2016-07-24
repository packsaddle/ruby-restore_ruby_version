require_relative 'helper'

module RestoreRubyVersion
  class TestRestore < Test::Unit::TestCase
    test 'version' do
      assert do
        !::RestoreRubyVersion::VERSION.nil?
      end
    end
  end
end
