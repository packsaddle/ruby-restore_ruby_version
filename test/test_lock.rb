require_relative 'helper'

module RestoreRubyVersion
  class TestLock < Test::Unit::TestCase
    # sub_test_case '.insert' do
    #   test 'v1.9 lock file' do
    #     lock_file = File.read('./test/fixtures/v1-9-example1.lock')
    #     section = ''
    #     assert do
    #       Lock.insert(lock_file, section) == Lock.new(lock_file)
    #     end
    #   end
    #   test 'v1.10 lock file' do
    #     deleted = File.read('./test/fixtures/v1-10-example1-deleted.lock')
    #     section = File.read('./test/fixtures/v1-10-example1-block.txt')
    #     lock_file = File.read('./test/fixtures/v1-10-example1.lock')
    #     assert do
    #       Lock.insert(deleted, section) == Lock.new(lock_file)
    #     end
    #   end
    # end

    sub_test_case '#delete' do
      test 'v1.11 lock file' do
        lock_file = File.read('./test/fixtures/bundle-1-11-2-Gemfile.lock')
        assert do
          Lock.new(lock_file).delete == Lock.new(lock_file)
        end
      end
      test 'v1.12 lock file' do
        lock_file = File.read('./test/fixtures/bundle-1-12-0-Gemfile.lock')
        deleted = File.read('./test/fixtures/bundle-1-12-0-Gemfile-deleted.lock')
        assert do
          Lock.new(lock_file).delete == Lock.new(deleted)
        end
      end
    end

    sub_test_case '#pick' do
      test 'v1.11 lock file' do
        lock_file_contents = File.read('./test/fixtures/bundle-1-11-2-Gemfile.lock')
        expected = ''
        assert do
          Lock.new(lock_file_contents).pick == expected
        end
      end
      test 'v1.12 lock file' do
        lock_file_contents = File.read('./test/fixtures/bundle-1-12-0-Gemfile.lock')
        expected = File.read('./test/fixtures/bundle-1-12-0-Gemfile-section.txt')
        assert do
          Lock.new(lock_file_contents).pick == expected
        end
      end
    end
  end
end
