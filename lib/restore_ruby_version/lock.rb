module RestoreRubyVersion
  class Lock < RestoreFromRepository::TargetFile
    REGEX_RUBY_VERSION = /Ruby/

    def delete
    end

    def pick
    end
  end
end
