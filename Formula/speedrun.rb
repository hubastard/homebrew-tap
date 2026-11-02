# Written by update.sh for speedrun v0.2.12: edits here are overwritten.
class Speedrun < Formula
  desc "Fast black-box UI tests for Android and iOS, in plain YAML"
  homepage "https://github.com/hubastard/speedrun"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/hubastard/speedrun/releases/download/v0.2.12/speedrun-v0.2.12-macos-arm64.tar.gz"
      sha256 "167177f4d311cf70a024f3469e368e8540294beb5bf8765fe083ba534390de08"
    end
  end

  on_linux do
    depends_on arch: :x86_64

    on_intel do
      url "https://github.com/hubastard/speedrun/releases/download/v0.2.12/speedrun-v0.2.12-linux-x86_64.tar.gz"
      sha256 "5ce999ae7469f92424dbd8ae146b871430cdba9a670e9497274271b97c0008be"
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
