# Written by update.sh for speedrun v0.4.7: edits here are overwritten.
class Speedrun < Formula
  desc "Fast black-box UI tests for Android and iOS, in plain YAML"
  homepage "https://github.com/hubastard/speedrun"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/hubastard/speedrun/releases/download/v0.4.7/speedrun-v0.4.7-macos-arm64.tar.gz"
      sha256 "e7d3fc78cf88fbe0b4c03d0cb09a515b8858d21bd1067a1decb274eb8f0a0ba9"
    end
  end

  on_linux do
    depends_on arch: :x86_64

    on_intel do
      url "https://github.com/hubastard/speedrun/releases/download/v0.4.7/speedrun-v0.4.7-linux-x86_64.tar.gz"
      sha256 "62d882936f902f30705061ccf90166b6e8c1ac56be533196bd30047518f35548"
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
