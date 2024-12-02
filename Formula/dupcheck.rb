class Dupcheck < Formula
  desc "A duplicate file discovery tool written in Rust."
  homepage "https://github.com/keaz/rust-duplicate-file-detector"
  url "https://github.com/keaz/rust-duplicate-file-detector/releases/download/v2.1.0/duplicate-checker-macos"
  sha256 "8d7f76a7c291da7949f3c8af133eded44e88a0023e44ead493761b4f969768d9"
  license "MIT/Apache-2.0"

  def install
    bin.install "duplicate-checker-macos"
    mv bin/"duplicate-checker-macos", bin/"duplicate-checker"
    if ENV["SHELL"].include?("zsh")
      real_home = ENV["HOMEBREW_REAL_HOME"] || Etc.getpwuid.dir
      zshrc_path = File.join(real_home, ".zshrc")

      system "mkdir", "-p" , "~/.zfunc"
      system "curl", "-o", "~/.zfunc/_duplicate-checker", "https://raw.githubusercontent.com/keaz/rust-duplicate-file-detector/refs/heads/main/.zfunc/_duplicate-checker"
      
      zshrc_content = File.read(zshrc_path)
      compinit_line = "autoload -Uz compinit && compinit"
      fpath_line = "fpath=(~/.zfunc $fpath)"

      unless zshrc_content.include?(fpath_line)
        File.open(zshrc_path, "a") do |file|
          file.puts "\n"
          file.puts fpath_line
        end
        puts "Added '#{fpath_line}' to .zshrc."
      else
        puts "'#{fpath_line}' already exists in .zshrc."
      end
      unless zshrc_content.include?(compinit_line)
        File.open(zshrc_path, "a") do |file|
          file.puts "\n"
          file.puts compinit_line
        end
        puts "Added '#{compinit_line}' to .zshrc."
      else
        puts "'#{compinit_line}' already exists in .zshrc."
      end
    elsif ENV["SHELL"].include?("bash")
      system "#{bin}/duplicate-checker", "completion", "bash"
    else
      system "echo The shell is neither zsh nor bash"
    end
  end

  test do
    system "#{bin}/duplicate-checker" "--help"
  end
end
