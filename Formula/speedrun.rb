# Written by update.sh for speedrun v0.4.13: edits here are overwritten.
class Speedrun < Formula
  desc "Fast black-box UI tests for Android and iOS, in plain YAML"
  homepage "https://github.com/hubastard/speedrun"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/hubastard/speedrun/releases/download/v0.4.13/speedrun-v0.4.13-macos-arm64.tar.gz"
      sha256 "d3a57196226a9c1f2aaeae6b7e3d013fe18dc52278f596ef96d62893a4809b8a"
    end
  end

  on_linux do
    depends_on arch: :x86_64

    on_intel do
      url "https://github.com/hubastard/speedrun/releases/download/v0.4.13/speedrun-v0.4.13-linux-x86_64.tar.gz"
      sha256 "1fbf319c93d018d0a608b876597b84d287c88768a855d8a45f4b12e17497809b"
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
