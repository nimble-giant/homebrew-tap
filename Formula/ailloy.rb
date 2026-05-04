class Ailloy < Formula
  desc "Package manager for AI instructions"
  homepage "https://github.com/nimble-giant/ailloy"
  version "0.6.27"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/nimble-giant/ailloy/releases/download/v#{version}/ailloy-darwin-arm64"
      sha256 "edfe872abd344029a028148a4fdbad829741d266f84ca30cd2ca81bf9ab9c0f9"
    end
    on_intel do
      url "https://github.com/nimble-giant/ailloy/releases/download/v#{version}/ailloy-darwin-amd64"
      sha256 "6d2663062ef329e1c3aa0b80a049bc81261e47facd9923aab216931d5d00afb2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nimble-giant/ailloy/releases/download/v#{version}/ailloy-linux-arm64"
      sha256 "8516e517a15d86a8d3fa3e2b8a3b3c0c7e21914b44a3970e8d3d67fa6c3aeb78"
    end
    on_intel do
      url "https://github.com/nimble-giant/ailloy/releases/download/v#{version}/ailloy-linux-amd64"
      sha256 "9596b5d207c94fbb93f6348b3f5e5d8612f1be21b44a10cb2fefea6f5334c658"
    end
  end

  def install
    suffix = OS.mac? ? "darwin" : "linux"
    arch = Hardware::CPU.arm? ? "arm64" : "amd64"
    bin.install "ailloy-#{suffix}-#{arch}" => "ailloy"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ailloy --version")
  end
end
