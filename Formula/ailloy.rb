class Ailloy < Formula
  desc "Package manager for AI instructions"
  homepage "https://github.com/nimble-giant/ailloy"
  version "0.6.25"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/nimble-giant/ailloy/releases/download/v#{version}/ailloy-darwin-arm64"
      sha256 "f66f45ab315ca5330aa36e53d26bd49965b7463b53ad00c412226bf10924376e"
    end
    on_intel do
      url "https://github.com/nimble-giant/ailloy/releases/download/v#{version}/ailloy-darwin-amd64"
      sha256 "05e71f9296db581017cab0f8b8890e045e9fbc903f72ccbe46e40715af529a35"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nimble-giant/ailloy/releases/download/v#{version}/ailloy-linux-arm64"
      sha256 "05dc718d16f53f59475e437bc1d54d2f74833fdf8822d92af31bb111f40b0d63"
    end
    on_intel do
      url "https://github.com/nimble-giant/ailloy/releases/download/v#{version}/ailloy-linux-amd64"
      sha256 "6c7545569511a81b35f4fbab58f18ec06d7c9cdfc06d1a1406ec3bbfc097a3bb"
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
