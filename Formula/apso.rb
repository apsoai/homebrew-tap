class Apso < Formula
  desc "CLI for the Apso backend-as-a-service platform"
  homepage "https://apso.ai"
  version "0.26.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/apsoai/cli/releases/download/v#{version}/apso-v#{version}-darwin-arm64.tar.gz"
      sha256 "d83f1f456893a42c48847a16d741425ee19bba064e469b0913c40057c954aae3"
    elsif Hardware::CPU.intel?
      url "https://github.com/apsoai/cli/releases/download/v#{version}/apso-v#{version}-darwin-x64.tar.gz"
      sha256 "e9ceed64abd057239c3753a3005d984d69c80685b07a63aa8f89767734073734"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/apsoai/cli/releases/download/v#{version}/apso-v#{version}-linux-x64.tar.gz"
      sha256 "908a3ba703f2e3a6dff71ffffc2e9d9cb9968e5fe3316b4be5c2dab2b829c913"
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
