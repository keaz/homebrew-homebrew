class Rfcp < Formula
  desc "A faster and more efficient command to copy files than CP"
  homepage "https://github.com/keaz/rust-copy"
  url "https://github.com/keaz/rust-copy/releases/download/v1.0.0/rfcp"
  sha256 "8b81511a4f2822b12234226a0d9279a8abdd4100897ecbbbccff72f857f85e37"
  license "MIT/Apache-2.0"

  def install
    bin.install "rfcp"
  end

  test do
    system "#{bin}/rfcp" "--help"
  end
end
