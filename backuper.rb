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
    print `ls -l #{Dir.pwd}`
    system "mkdir -p _#{distdir} && mv [A-Za-z]* _#{distdir} && mv _src src && rm -rf /tmp/go && mv #{Dir.pwd} /tmp/go"
    print `ls -l #{Dir.pwd}`
    print `ls -l /tmp/go`
    print `ls -l #{distdir}`
    print `cd /tmp/go#{distdir} && pwd`
    system "cd #{distdir} && GOPATH=/tmp/go make brew"
    exit
    bin.install "#{distdir}/gobackuper"
  end

  test do
    assert_equal "      23\n", `gobackuper -help | wc -l`
  end
end
