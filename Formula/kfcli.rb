class Kfcli < Formula
  desc "A CLI tool to monitor Kafka topics and produce/consume messages"
  homepage "https://github.com/keaz/kcli"
  url "https://github.com/keaz/kcli/releases/download/v0.2.0-alpha/kfcli-macos"
  version "v0.2.0-alpha"
  sha256 "19a60662ad5909b714e7ba75c99a5ded28a30d55db4aceac704d77dfd14bbb22"
  license "GPL-3.0"

  def install
    bin.install "kfcli-macos"
    mv bin/"kfcli-macos", bin/"kfcli"
  end

  test do
    system "#{bin}/kfcli", "-h"
  end
end
