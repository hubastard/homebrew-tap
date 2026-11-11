# Written by update.sh for speedrun v0.4.12: edits here are overwritten.
class Speedrun < Formula
  desc "Fast black-box UI tests for Android and iOS, in plain YAML"
  homepage "https://github.com/hubastard/speedrun"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/hubastard/speedrun/releases/download/v0.4.12/speedrun-v0.4.12-macos-arm64.tar.gz"
      sha256 "eeaad7a9604d86701ef60134ce00c820785aae4db0b74ffbe00e5cbd6c937b5f"
    end
  end

  on_linux do
    depends_on arch: :x86_64

    on_intel do
      url "https://github.com/hubastard/speedrun/releases/download/v0.4.12/speedrun-v0.4.12-linux-x86_64.tar.gz"
      sha256 "aab27ffa0b84ed8912ade73ea4d671ed766ab6773b99618bd6f65f44a1325e35"
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
