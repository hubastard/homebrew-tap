# Written by update.sh for speedrun v0.2.0: edits here are overwritten.
class Speedrun < Formula
  desc "Fast black-box UI tests for Android and iOS, in plain YAML"
  homepage "https://github.com/hubastard/speedrun"
  version "0.2.0"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/hubastard/speedrun/releases/download/v0.2.0/speedrun-v0.2.0-macos-arm64.tar.gz"
      sha256 "a741c7e5170c4d3a5f2b4c2748d79bd43642f85bd37cebeb23600cbef3a9cd83"
    end
  end

  on_linux do
    depends_on arch: :x86_64

    on_intel do
      url "https://github.com/hubastard/speedrun/releases/download/v0.2.0/speedrun-v0.2.0-linux-x86_64.tar.gz"
      sha256 "cd57915fc4cef305531ccf66522f0f2c5cf2c0908b34a4bf07cdee9f89b7aa31"
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
