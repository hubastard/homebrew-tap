# Written by update.sh for speedrun v0.4.14: edits here are overwritten.
class Speedrun < Formula
  desc "Fast black-box UI tests for Android and iOS, in plain YAML"
  homepage "https://github.com/hubastard/speedrun"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/hubastard/speedrun/releases/download/v0.4.14/speedrun-v0.4.14-macos-arm64.tar.gz"
      sha256 "c8ffd4fc71415533e6041180a0024006bac2a6d1ce5e8a6d8d1d7c94af7a4a44"
    end
  end

  on_linux do
    depends_on arch: :x86_64

    on_intel do
      url "https://github.com/hubastard/speedrun/releases/download/v0.4.14/speedrun-v0.4.14-linux-x86_64.tar.gz"
      sha256 "55b57489e9969f0fc70da0cac16d0e68f82da2134b4fc22ea04d35eac7d41bb2"
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
