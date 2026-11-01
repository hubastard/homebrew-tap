# Written by update.sh for speedrun v0.2.10: edits here are overwritten.
class Speedrun < Formula
  desc "Fast black-box UI tests for Android and iOS, in plain YAML"
  homepage "https://github.com/hubastard/speedrun"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/hubastard/speedrun/releases/download/v0.2.10/speedrun-v0.2.10-macos-arm64.tar.gz"
      sha256 "a02afb23dd485b5fc89f283e78a357e16e60d22dee59f7aa5b6aaa466da57d90"
    end
  end

  on_linux do
    depends_on arch: :x86_64

    on_intel do
      url "https://github.com/hubastard/speedrun/releases/download/v0.2.10/speedrun-v0.2.10-linux-x86_64.tar.gz"
      sha256 "1994feaf483e291b482e12d50abd6cab4b96e0fefebea7a79ce3ec3a806f6824"
    end
  end

  def install
    bin.install "speedrun"
  end

  def caveats
    <<~TEXT
      Android: adb on your PATH and an emulator or device.
      iOS (macOS): Xcode and a booted simulator.
    TEXT
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/speedrun --version")
  end
end
