class Kfcli < Formula
  desc "A CLI tool to monitor Kafka topics and produce/consume messages"
  homepage "https://github.com/keaz/kcli"
  url "https://github.com/keaz/kcli/releases/download/v0.0.4-alpha/kfcli-macos"
  version "v0.0.4-alpha"
  sha256 "e47abd3dff05f7715e3f635331e5d160a1570edcb21d56a4db04980ebd817de0"
  license "GPL-3.0"

  def install
    bin.install "kfcli-macos"
    mv bin/"kfcli-macos", bin/"kfcli"
  end

  test do
    system "#{bin}/kfcli", "-h"
  end
end
