class Ailloy < Formula
  desc "Package manager for AI instructions"
  homepage "https://github.com/nimble-giant/ailloy"
  version "0.6.37"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/nimble-giant/ailloy/releases/download/v#{version}/ailloy-darwin-arm64"
      sha256 "7e091f40e67a401509de92bfdeb4feea67d4ad85505fd15dbd3bb4813d579d0e"
    end
    on_intel do
      url "https://github.com/nimble-giant/ailloy/releases/download/v#{version}/ailloy-darwin-amd64"
      sha256 "359525ddcb4c1f1d14f878f05b0ea20abfa252392f3410ea99f9c066ab6d1331"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nimble-giant/ailloy/releases/download/v#{version}/ailloy-linux-arm64"
      sha256 "43d1456be1b029f482b3ff6735e51660e45ce94a9ce312ed1b00c5a8d404538a"
    end
    on_intel do
      url "https://github.com/nimble-giant/ailloy/releases/download/v#{version}/ailloy-linux-amd64"
      sha256 "e2ace211dc4914da52030cec2d2f0ef6650b0dfe4c625d4aef6252b2ad4c9b46"
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
