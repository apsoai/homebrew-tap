class Apso < Formula
  desc "CLI for the Apso backend-as-a-service platform"
  homepage "https://apso.ai"
  version "0.10.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/apsoai/cli/releases/download/v#{version}/apso-v#{version}-darwin-arm64.tar.gz"
      sha256 "0fe9b8e17b384cf2c678be3769ad763d691e6078f5a181d3c3836a0dc6ddc6f8"
    elsif Hardware::CPU.intel?
      url "https://github.com/apsoai/cli/releases/download/v#{version}/apso-v#{version}-darwin-x64.tar.gz"
      sha256 "c9274d4defd2c07b61d6381e51ca013cfb52f1b9537f8244a9f6d3a6cbd3479b"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/apsoai/cli/releases/download/v#{version}/apso-v#{version}-linux-x64.tar.gz"
      sha256 "f7f2f3ee3724c7f5847968371c560bc391efa54de8de8fd3a3ca330b295b2f12"
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
