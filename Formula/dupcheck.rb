class Dupcheck < Formula
  desc "A duplicate file discovery tool written in Rust."
  homepage "https://github.com/keaz/rust-duplicate-file-detector"
  url "https://github.com/keaz/rust-duplicate-file-detector/releases/download/v2.0.2/duplicate-checker"
  sha256 "fadbd42cd905a952ef235819e57598e80f48b92787f3bcb8c9aad78cab0aa571"
  license "MIT/Apache-2.0"

  def install
    bin.install "duplicate-checker"
    if ENV["SHELL"].include?("zsh")
      system "mkdir", "-p" , "~/.zfunc"
      system "curl", "-o", "~/.zfunc/__duplicate-checker", "https://raw.githubusercontent.com/keaz/rust-duplicate-file-detector/refs/heads/main/.zfunc/_duplicate-checker"
      system "echo 'fpath=(~/.zfunc $fpath)' >> ~/.zshrc"
      system "echo 'autoload -Uz compinit && compinit' >> ~/.zshrc"
    elsif ENV["SHELL"].include?("bash")
      system "#{bin}/kfcli", "completion", "bash"
    else
      system "echo The shell is neither zsh nor bash"
    end
  end

  test do
    system "#{bin}/duplicate-checker" "--help"
  end
end
