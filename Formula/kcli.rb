class Kcli < Formula
  desc "A CLI tool to monitor Kafka topics and produce/consume messages"
  homepage "https://github.com/keaz/kcli"
  url "https://github.com/keaz/kcli/releases/download/v0.1.0-alpha/kcli"
  sha256 "a248bd8f219afc4af6610d255c7aa3fbe0512dbf586e7cd86005f97a44fc56cc"
  license "GPL-3.0"

  def install
    bin.install "kcli"
  end

  test do
    system "#{bin}/kcli" "--help"
  end
end
