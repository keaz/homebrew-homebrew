require "etc"
require "net/http"
require "uri"

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
      zfunc_path = File.join(real_home, ".zfunc")

      zshrc_content = File.read(zshrc_path)
      compinit_line = "autoload -Uz compinit && compinit"
      fpath_line = "fpath=(~/.zfunc $fpath)"
      zfunc_file_url = "https://raw.githubusercontent.com/keaz/rust-duplicate-file-detector/refs/heads/main/.zfunc/_duplicate-checker"
      zfunc_file_path = File.join(zfunc_path, "_duplicate-checker")

      # Ensure the .zfunc directory exists
      unless Dir.exist?(zfunc_path)
        Dir.mkdir(zfunc_path)
        puts "Created directory: #{zfunc_path}"
      else
        puts "Directory already exists: #{zfunc_path}"
      end

      # Download and save the _duplicate-checker file
      uri = URI(zfunc_file_url)
      response = Net::HTTP.get_response(uri)

      if response.is_a?(Net::HTTPSuccess)
        File.write(zfunc_file_path, response.body)
        puts "Downloaded and saved _duplicate-checker to #{zfunc_file_path}."
      else
        puts "Failed to download _duplicate-checker. HTTP Status: #{response.code}"
      end

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
