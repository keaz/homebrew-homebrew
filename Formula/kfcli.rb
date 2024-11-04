class Kfcli < Formula
  desc "A CLI tool to monitor Kafka topics and produce/consume messages"
  homepage "https://github.com/keaz/kcli"
  url "https://github.com/keaz/qtable/releases/download/v2.0.11-alpha/qtable-macos-universal"
  version "cb147a20cc1f56aaad8dbd7d1989075996c44c131e63d42cb14e561ac546d4c4"
  license "GPL-3.0"
  version "v2.0.11-alpha"

  def install
    bin.install "kfcli-macos"
    mv bin/"kfcli-macos", bin/"kfcli"
  end

  test do
    system "#{bin}/kfcli", "-h"
  end
end
