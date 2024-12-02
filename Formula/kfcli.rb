class Kfcli < Formula
  desc "A CLI tool to monitor Kafka topics and produce/consume messages"
  homepage "https://github.com/keaz/kcli"
  url "https://github.com/keaz/kcli/releases/download/v0.2.1-alpha/kfcli-macos"
  version "v0.2.1-alpha"
  sha256 "d1a96aac36f6759934d89db4367598651189957b31cd0a312ea49ca21af70553"
  license "GPL-3.0"

  def install
    bin.install "kfcli-macos"
    mv bin/"kfcli-macos", bin/"kfcli"
  end

  def caveats
    if ENV["SHELL"].include?("zsh")
      <<~EOS
        To complete the setup, run the following commands:

        mkdir -p ~/.zfunc
        curl -o ~/.zfunc/_kfcli https://raw.githubusercontent.com/keaz/kcli/main/.zfunc/_kfcli
        echo 'autoload -Uz compinit && compinit' >> ~/.zshrc
        echo 'fpath=(~/.zfunc $fpath)' >> ~/.zshrc
        source ~/.zshrc

        This will configure Zsh and download the required file.
      EOS
    elsif ENV["SHELL"].include?("bash")
      <<~EOS
        To complete the setup, run the following command:

        mkdir -p ~/.bash_completion.d
        curl -o ~/.bash_completion.d/kfcli https://raw.githubusercontent.com/keaz/kcli/main/.bash_completion.d/kfcli.bash
        echo 'source ~/.bash_completion.d/kfcli' >> ~/.bashrc
        source ~/.bashrc
        
        This will configure Bash and download the required file.
      EOS
    else
      system "echo The shell is neither zsh nor bash"
    end
  end

  test do
    system "#{bin}/kfcli", "-h"
  end
end
