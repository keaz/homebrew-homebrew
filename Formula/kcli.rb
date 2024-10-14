class Kcli < Formula
  desc "A CLI tool to monitor Kafka topics and produce/consume messages"
  homepage "https://github.com/keaz/kcli"
  url "https://github.com/keaz/kcli/releases/download/v0.1.0-alpha/kcli"
  sha256 "37f729fd5bf899c01194cce8eb833d58cea8264f10ae6ca1f4ee741bf912d61a"
  license "GPL-3.0"
  version "0.1.0-alpha"

  def install
    bin.install "kcli"
  end

  test do
    system "#{bin}/kcli" "--help"
  end
end
