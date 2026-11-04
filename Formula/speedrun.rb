# Written by update.sh for speedrun v0.4.4: edits here are overwritten.
class Speedrun < Formula
  desc "Fast black-box UI tests for Android and iOS, in plain YAML"
  homepage "https://github.com/hubastard/speedrun"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/hubastard/speedrun/releases/download/v0.4.4/speedrun-v0.4.4-macos-arm64.tar.gz"
      sha256 "f48bc96afc51503b88db47749d79ac723f06002ded720b3dd2627da7def37259"
    end
  end

  on_linux do
    depends_on arch: :x86_64

    on_intel do
      url "https://github.com/hubastard/speedrun/releases/download/v0.4.4/speedrun-v0.4.4-linux-x86_64.tar.gz"
      sha256 "fd6ba24242e6f891de2911db3c91ad3f617671792195564314ac2553b30ebd49"
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
