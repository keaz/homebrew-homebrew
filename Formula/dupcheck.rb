class Dupcheck < Formula
  desc "A duplicate file discovery tool written in Rust."
  homepage "https://github.com/keaz/rust-duplicate-file-detector"
  url "https://github.com/keaz/rust-duplicate-file-detector/releases/download/v2.1.0/duplicate-checker-macos"
  sha256 "8d7f76a7c291da7949f3c8af133eded44e88a0023e44ead493761b4f969768d9"
  license "MIT/Apache-2.0"

  def install
    bin.install "duplicate-checker-macos"
    mv bin/"duplicate-checker-macos", bin/"duplicate-checker"
  end

  def caveats
    if ENV["SHELL"].include?("zsh")
      <<~EOS
        To complete the setup, run the following commands:

        mkdir -p ~/.zfunc
        curl -o ~/.zfunc/_duplicate-checker https://raw.githubusercontent.com/keaz/rust-duplicate-file-detector/refs/heads/main/.zfunc/_duplicate-checker
        echo 'autoload -Uz compinit && compinit' >> ~/.zshrc
        echo 'fpath=(~/.zfunc $fpath)' >> ~/.zshrc
        source ~/.zshrc

        This will configure Zsh and download the required file.
      EOS
    elsif ENV["SHELL"].include?("bash")
      <<~EOS
        To complete the setup, run the following command:

        mkdir -p ~/.bash_completion.d
        curl -o ~/.bash_completion.d/duplicate-checker https://raw.githubusercontent.com/keaz/rust-duplicate-file-detector/refs/heads/main/.bash_completion.d/duplicate-checker.bash
        echo 'source ~/.bash_completion.d/duplicate-checker' >> ~/.bashrc
        source ~/.bashrc
        
        This will configure Bash and download the required file.
      EOS
    else
      system "echo The shell is neither zsh nor bash"
    end
  end

  test do
    system "#{bin}/duplicate-checker" "--help"
  end
end
