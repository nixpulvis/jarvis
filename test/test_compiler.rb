require 'test_helper'

class CompilerTest < Test::Unit::TestCase
  def default_compiler; Jarhead::Compiler.new; end
  def extended_compiler; Jarhead::Compiler.new ["src", "test"]; end

  def test_compiler_creation
    assert_equal ["src"], default_compiler.source_path
    assert_equal ["src", "test"], extended_compiler.source_path
  end

  def test_files
    assert_equal ["src/*.java"], default_compiler.files
    assert_equal ["src/*.java", "test/*.java"], extended_compiler.files
  end

  def test_compile
    with_working_java 'src' do
      assert_equal true, default_compiler.compile
    end

    with_broken_java 'src' do
      assert_equal false, default_compiler.compile
    end
  end

  def test_run
    with_working_java 'src' do
      default_compiler.compile
      assert_equal true, default_compiler.run("TestClass")
    end
  end
end