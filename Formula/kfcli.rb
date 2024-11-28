class Kfcli < Formula
  desc "A CLI tool to monitor Kafka topics and produce/consume messages"
  homepage "https://github.com/keaz/kcli"
  url "https://github.com/keaz/kcli/releases/download/v0.2.1-alpha/kfcli-macos"
  version "v0.2.1-alpha"
  sha256 "d1a96aac36f6759934d89db4367598651189957b31cd0a312ea49ca21af70553"
  license "GPL-3.0"

  def install
    bin.install "kfcli-macos"
    mv bin/"kfcli-macos", bin/"kfcli"
  end

  test do
    system "#{bin}/kfcli", "-h"
  end
end
