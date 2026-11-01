# Written by update.sh for speedrun v0.2.9: edits here are overwritten.
class Speedrun < Formula
  desc "Fast black-box UI tests for Android and iOS, in plain YAML"
  homepage "https://github.com/hubastard/speedrun"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/hubastard/speedrun/releases/download/v0.2.9/speedrun-v0.2.9-macos-arm64.tar.gz"
      sha256 "b609e9f7360293b69e895f857c6c56443ac422e0e9d1119f1dfe001e334e4fce"
    end
  end

  on_linux do
    depends_on arch: :x86_64

    on_intel do
      url "https://github.com/hubastard/speedrun/releases/download/v0.2.9/speedrun-v0.2.9-linux-x86_64.tar.gz"
      sha256 "f211cc69acaec16f0c69d215d66878602eb83063178837db3b60283a79f223f5"
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
