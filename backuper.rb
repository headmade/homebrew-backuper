require "formula"

class Backuper < Formula

  homepage "https://github.com/headmade/backuper"
  url "https://github.com/headmade/backuper/archive/v0.0.1.zip"
  version "0.0.1"
  sha1 "1ccf91701ca4c2caf65a131f9ffeb7633e0cde26"

  depends_on "go"
  depends_on "openssl"

  def install
    distdir = 'src/github.com/headmade/backuper'
    gopath = Dir.pwd
    system "mkdir -p _#{distdir} && mv [A-Za-z]* _#{distdir} && mv _src src"
    system "cd #{distdir} && GOPATH=#{gopath} make brew"
    bin.install "#{distdir}/gobackuper"

    system "GOPATH=#{gopath} go get github.com/rlmcpherson/s3gof3r/gof3r"
    bin.install "#{gopath}/bin/gof3r"
  end

  test do
    assert_equal "      23\n", `gobackuper -help | wc -l`
  end
end
