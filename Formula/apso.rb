class Apso < Formula
  desc "CLI for the Apso backend-as-a-service platform"
  homepage "https://apso.ai"
  version "0.42.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/apsoai/cli/releases/download/v#{version}/apso-v#{version}-darwin-arm64.tar.gz"
      sha256 "6d095410c48fcb013aeb62817f56ff1e2490ac3a6287e151818f9f38b0a3fbc5"
    elsif Hardware::CPU.intel?
      url "https://github.com/apsoai/cli/releases/download/v#{version}/apso-v#{version}-darwin-x64.tar.gz"
      sha256 "7678d6728c4988507affe0fd660fda3217957ca68c37d05796e990d6d4e37250"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/apsoai/cli/releases/download/v#{version}/apso-v#{version}-linux-x64.tar.gz"
      sha256 "70ecc50e0886385e97c42e0e1226f20427e310d7f7d054894a3cf2079f2cbc52"
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
