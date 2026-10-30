# Written by update.sh for speedrun v0.2.3: edits here are overwritten.
class Speedrun < Formula
  desc "Fast black-box UI tests for Android and iOS, in plain YAML"
  homepage "https://github.com/hubastard/speedrun"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/hubastard/speedrun/releases/download/v0.2.3/speedrun-v0.2.3-macos-arm64.tar.gz"
      sha256 "f2046ec90c28ec1f457c6666ea20413338095a3d732cb8aa05692118440d052d"
    end
  end

  on_linux do
    depends_on arch: :x86_64

    on_intel do
      url "https://github.com/hubastard/speedrun/releases/download/v0.2.3/speedrun-v0.2.3-linux-x86_64.tar.gz"
      sha256 "608823b4888c13ab8cf64ef5b2980c22484cc4e48e5b6d2f00d94b906c659101"
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
