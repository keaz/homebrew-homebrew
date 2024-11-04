class Kfcli < Formula
  desc "A CLI tool to monitor Kafka topics and produce/consume messages"
  homepage "https://github.com/keaz/kcli"
  url "https://github.com/keaz/qtable/releases/download/v2.0.11-alpha/qtable-macos-universal"
  version "v2.0.11-alpha"
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
