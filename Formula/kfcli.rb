class Kfcli < Formula
  desc "A CLI tool to monitor Kafka topics and produce/consume messages"
  homepage "https://github.com/keaz/kcli"
  url "https://github.com/keaz/kcli/releases/download/v0.0.1-alpha/kfcli-macos"
  version "v0.0.1-alpha"
  sha "d271f279e9dc0ee0ed5a66f38be16acdbe67f7f6e17a1b86fc8e7f9fb4c84e97"
  license "GPL-3.0"

  def install
    bin.install "kfcli-macos"
    mv bin/"kfcli-macos", bin/"kfcli"
  end

  test do
    system "#{bin}/kfcli", "-h"
  end
end
