class Apso < Formula
  desc "CLI for the Apso backend-as-a-service platform"
  homepage "https://apso.ai"
  version "0.11.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/apsoai/cli/releases/download/v#{version}/apso-v#{version}-darwin-arm64.tar.gz"
      sha256 "a23ee26e63e89f46be38ffa1f508273d67e715bde5c98c00ca47012f2aecbbb8"
    elsif Hardware::CPU.intel?
      url "https://github.com/apsoai/cli/releases/download/v#{version}/apso-v#{version}-darwin-x64.tar.gz"
      sha256 "0f028080a038e33f21650b2f1b4af001955d2a6fe389cdcc9d040f415cab8bf5"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/apsoai/cli/releases/download/v#{version}/apso-v#{version}-linux-x64.tar.gz"
      sha256 "1f1205c1238a5f787d153fb73c52182bcb405c6804d87368ebb783fdce26ab08"
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
