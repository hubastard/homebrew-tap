# Written by update.sh for speedrun v0.2.7: edits here are overwritten.
class Speedrun < Formula
  desc "Fast black-box UI tests for Android and iOS, in plain YAML"
  homepage "https://github.com/hubastard/speedrun"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/hubastard/speedrun/releases/download/v0.2.7/speedrun-v0.2.7-macos-arm64.tar.gz"
      sha256 "84cf58d148ee29c3a4642abf8bcfb0f882db3274594dfb887754ffb67aea90df"
    end
  end

  on_linux do
    depends_on arch: :x86_64

    on_intel do
      url "https://github.com/hubastard/speedrun/releases/download/v0.2.7/speedrun-v0.2.7-linux-x86_64.tar.gz"
      sha256 "8c65407b465c67ec87a37ac5c721b86260e3faa10d2b4076a28c8d1297fb2c2d"
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
