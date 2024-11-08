class Kfcli < Formula
  desc "A CLI tool to monitor Kafka topics and produce/consume messages"
  homepage "https://github.com/keaz/kcli"
  url "https://github.com/keaz/kcli/releases/download/v0.0.3-alpha/kfcli-macos"
  version "v0.0.3-alpha"
  sha256 "d0a22a29fdc8a5bb183d926137cc70ba5c33f55fceaf5c67df4d4c599fdb2756"
  license "GPL-3.0"

  def install
    bin.install "kfcli-macos"
    mv bin/"kfcli-macos", bin/"kfcli"
  end

  test do
    system "#{bin}/kfcli", "-h"
  end
end
