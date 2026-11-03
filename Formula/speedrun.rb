# Written by update.sh for speedrun v0.2.13: edits here are overwritten.
class Speedrun < Formula
  desc "Fast black-box UI tests for Android and iOS, in plain YAML"
  homepage "https://github.com/hubastard/speedrun"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/hubastard/speedrun/releases/download/v0.2.13/speedrun-v0.2.13-macos-arm64.tar.gz"
      sha256 "f4d7bec6b164056812c9b553cdeba6dd8c47fc3d7c394e3808094ff8ab14d159"
    end
  end

  on_linux do
    depends_on arch: :x86_64

    on_intel do
      url "https://github.com/hubastard/speedrun/releases/download/v0.2.13/speedrun-v0.2.13-linux-x86_64.tar.gz"
      sha256 "3a65f4e0e992626033439b8d9be40d6c2b3b3fad2ef67b1234bb055c4f921dfa"
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
