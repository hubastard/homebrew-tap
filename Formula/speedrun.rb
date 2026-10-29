# Written by update.sh for speedrun v0.2.1: edits here are overwritten.
class Speedrun < Formula
  desc "Fast black-box UI tests for Android and iOS, in plain YAML"
  homepage "https://github.com/hubastard/speedrun"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/hubastard/speedrun/releases/download/v0.2.1/speedrun-v0.2.1-macos-arm64.tar.gz"
      sha256 "3ace7a216411cfcc08835f30329f2ecddc8f4bf44344e3dcd3973057a4ba0977"
    end
  end

  on_linux do
    depends_on arch: :x86_64

    on_intel do
      url "https://github.com/hubastard/speedrun/releases/download/v0.2.1/speedrun-v0.2.1-linux-x86_64.tar.gz"
      sha256 "59ca8066321f44915029afeda3ab5724d6b01d4975473cc942aaf9842a59fa69"
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
