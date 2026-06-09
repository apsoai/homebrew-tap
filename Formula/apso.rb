class Apso < Formula
  desc "CLI for the Apso backend-as-a-service platform"
  homepage "https://apso.ai"
  version "0.13.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/apsoai/cli/releases/download/v#{version}/apso-v#{version}-darwin-arm64.tar.gz"
      sha256 "37f9ba24caf65f58f51d341069fc79ad07b59a52de86740e4a519a7461a217e2"
    elsif Hardware::CPU.intel?
      url "https://github.com/apsoai/cli/releases/download/v#{version}/apso-v#{version}-darwin-x64.tar.gz"
      sha256 "743a5dfd478d16b0b29fe4e38bb563b1639eb29dad72bb6eb21507b807c428d0"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/apsoai/cli/releases/download/v#{version}/apso-v#{version}-linux-x64.tar.gz"
      sha256 "d4bc131a80246c4cec9a9f1d84bbb98482968ea0d68fe9f1257dcadfdd86cad3"
    end
  end

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/apso"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/apso --version")
  end
end
