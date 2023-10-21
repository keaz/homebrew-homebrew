class Rfcp < Formula
  desc "A faster and more eficent command to copy files than CP"
  homepage "https://github.com/keaz/rust-copy"
  url "https://github.com/keaz/rust-copy/releases/download/v0.2.2/rfcp"
  sha256 "649bbba1d6f05439a80d1e6fb65e6a4fd7430a345f0aee7057ef35329e392c29"
  license "MIT/Apache-2.0"

  def install
    bin.install "rfcp"
  end

  test do
    system "#{bin}/rfcp --help"
  end
end
