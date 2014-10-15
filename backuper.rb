require "formula"

class Backuper < Formula

  homepage "https://github.com/headmade/backuper"
  url "https://github.com/headmade/backuper/archive/v0.0.1.zip"
  version "0.0.1"
  sha1 ""

  depends_on "go"
  depends_on "openssl"

  def install
    distdir = 'src/github.com/headmade/backuper'
    print "here"
    print system "ls -lR #{Dir.pwd}"
    print system "mkdir -p _#{distdir} && mv [a-z]* _#{distdir} && mv _src src"
    print system "ls -lR #{Dir.pwd}"
    print system "cd #{distdir} && ls -l && GOPATH=#{Dir.pwd} make brew"
    exit
    bin.install "#{distdir}/gobackuper"
  end

  test do
    assert_equal "      23\n", `gobackuper -help | wc -l`
  end
end
