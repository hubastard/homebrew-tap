# Written by update.sh for speedrun v0.4.5: edits here are overwritten.
class Speedrun < Formula
  desc "Fast black-box UI tests for Android and iOS, in plain YAML"
  homepage "https://github.com/hubastard/speedrun"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/hubastard/speedrun/releases/download/v0.4.5/speedrun-v0.4.5-macos-arm64.tar.gz"
      sha256 "0c4e8b8cb70da6a4ce910b432dea1ce129674b6486604d13e4180a9c0a72c22a"
    end
  end

  on_linux do
    depends_on arch: :x86_64

    on_intel do
      url "https://github.com/hubastard/speedrun/releases/download/v0.4.5/speedrun-v0.4.5-linux-x86_64.tar.gz"
      sha256 "4d5b64732e9f92c09914447ccec80cb8706f58cb74b1209c9f68a0093180b6f4"
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
