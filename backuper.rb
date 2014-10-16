require "formula"

class Backuper < Formula

  homepage "https://github.com/headmade/backuper"
  url "https://github.com/headmade/backuper/archive/v0.0.1.zip"
  version "0.0.1"
  sha1 ""

  depends_on "go" => :build
  depends_on "openssl"

  def install
    distdir = 'src/github.com/headmade/backuper'
    gopath = Dir.pwd
    system "mkdir -p _#{distdir} && mv [A-Za-z]* _#{distdir} && mv _src src"
    system "cd #{distdir} && GOPATH=#{gopath} make brew"
    bin.install "#{distdir}/gobackuper"

    system "GOPATH=#{gopath} go get github.com/rlmcpherson/s3gof3r/gof3r"
    system "mv #{gopath}/bin/gof3r #{gopath}/bin/gobackuper_gof3r"
    bin.install "#{gopath}/bin/gobackuper_gof3r"
  end

  test do
    assert_equal "      23\n", `gobackuper -help | wc -l`
  end
end
