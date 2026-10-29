# Written by update.sh for speedrun v0.2.2: edits here are overwritten.
class Speedrun < Formula
  desc "Fast black-box UI tests for Android and iOS, in plain YAML"
  homepage "https://github.com/hubastard/speedrun"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/hubastard/speedrun/releases/download/v0.2.2/speedrun-v0.2.2-macos-arm64.tar.gz"
      sha256 "1074a92761c480c53c3a826181a6c31f09866818be637e82ae0ae7c6a1fbc89c"
    end
  end

  on_linux do
    depends_on arch: :x86_64

    on_intel do
      url "https://github.com/hubastard/speedrun/releases/download/v0.2.2/speedrun-v0.2.2-linux-x86_64.tar.gz"
      sha256 "e8bf3e89073ed19f8304e4bb938403cfa698466c596ac7bdb9bd74e4bdf1e011"
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
