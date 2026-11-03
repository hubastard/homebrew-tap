# Written by update.sh for speedrun v0.4.1: edits here are overwritten.
class Speedrun < Formula
  desc "Fast black-box UI tests for Android and iOS, in plain YAML"
  homepage "https://github.com/hubastard/speedrun"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/hubastard/speedrun/releases/download/v0.4.1/speedrun-v0.4.1-macos-arm64.tar.gz"
      sha256 "3447f4455fb0fb81465cde53f2ed3b37d4d26e25ce88ee72afea74128ce6a41e"
    end
  end

  on_linux do
    depends_on arch: :x86_64

    on_intel do
      url "https://github.com/hubastard/speedrun/releases/download/v0.4.1/speedrun-v0.4.1-linux-x86_64.tar.gz"
      sha256 "c575f24a603861eab98dcf95deaae53e9feb5e3f17bc5f7d96a02f4c6fb734ea"
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
