# Written by update.sh for speedrun v0.4.2: edits here are overwritten.
class Speedrun < Formula
  desc "Fast black-box UI tests for Android and iOS, in plain YAML"
  homepage "https://github.com/hubastard/speedrun"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/hubastard/speedrun/releases/download/v0.4.2/speedrun-v0.4.2-macos-arm64.tar.gz"
      sha256 "d150c7101fab086c80f3a4997db2da8b0db51c217e6fee526b7a5d4679f76abf"
    end
  end

  on_linux do
    depends_on arch: :x86_64

    on_intel do
      url "https://github.com/hubastard/speedrun/releases/download/v0.4.2/speedrun-v0.4.2-linux-x86_64.tar.gz"
      sha256 "6294ed59fba7aa80d900ff86ea3bfe4c322d15f90f41b8e1d0a8d68df7af41bf"
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
