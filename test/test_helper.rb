require 'fileutils'
require 'test/unit'
require 'jarhead'

WORKING_CODE = <<-END
class TestClass {
  public static void main(String[] args) {
    System.out.println("ho");
  }
}
END

BROKEN_CODE = <<-END
class TestClass {

  foo(x) {
    12;
  }

  public static void main(String[] args) {
    System.out.println("ho")
  }
}
END

def with_working_java( path )
  if File.exists? path
    raise "File/Directory already exists #{path}"
  end

  Dir.mkdir path
  File.open File.join(path, "TestClass.java"), 'w' do |f|
    f.write WORKING_CODE
  end

  begin
    yield
  ensure
    FileUtils.rm_rf path
  end

end

def with_broken_java( path )
  if File.exists? path
    raise "File/Directory already exists #{path}"
  end

  Dir.mkdir path
  File.open File.join(path, "TestClass.java"), 'w' do |f|
    f.write BROKEN_CODE
  end

  begin
    yield
  ensure
    FileUtils.rm_rf path
  end

end