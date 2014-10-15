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
    system "mkdir -p _#{distdir} && mv [A-Za-z]* _#{distdir} && mv _src src"
    system "cd #{distdir} && GOPATH=#{Dir.pwd} make brew"
    bin.install "#{distdir}/gobackuper"
  end

  test do
    assert_equal "      23\n", `gobackuper -help | wc -l`
  end
end
