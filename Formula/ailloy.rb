class Ailloy < Formula
  desc "Package manager for AI instructions"
  homepage "https://github.com/nimble-giant/ailloy"
  version "0.6.42"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/nimble-giant/ailloy/releases/download/v#{version}/ailloy-darwin-arm64"
      sha256 "dd85e0c1d837dfac77c9608452a85dd1802a8dc26d0575c1a7c1574adf332ff0"
    end
    on_intel do
      url "https://github.com/nimble-giant/ailloy/releases/download/v#{version}/ailloy-darwin-amd64"
      sha256 "b69208614e0353a1a0ff03592c4f9a836876d5f5f00fea0ad340fd001bbe7978"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nimble-giant/ailloy/releases/download/v#{version}/ailloy-linux-arm64"
      sha256 "bce7b1549ff805a2327dd56be85c8c71410eaeba96f5e26ce10ec826e4257754"
    end
    on_intel do
      url "https://github.com/nimble-giant/ailloy/releases/download/v#{version}/ailloy-linux-amd64"
      sha256 "67e111b38b82c2814770cd34421fecde2dc2e812e79c0fb2f71b1ef66a6e1eca"
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
