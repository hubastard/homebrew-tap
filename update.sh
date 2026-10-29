#!/usr/bin/env bash
# Writes Formula/speedrun.rb for speedrun's latest release (or VERSION=vX.Y.Z), from the
# SHA-256 published next to each of its packages. While the release still lacks a package or
# its checksum (the macOS one is uploaded after the Linux one), it leaves the formula as it is.
set -euo pipefail
cd "$(dirname "$0")"

REPO="${SPEEDRUN_REPO:-hubastard/speedrun}"
DOWNLOADS="${SPEEDRUN_DOWNLOAD_URL:-https://github.com/$REPO/releases/download}"
version="${VERSION:-$(gh api "repos/$REPO/releases/latest" --jq .tag_name)}"
[[ $version =~ ^v[0-9]+\.[0-9]+\.[0-9]+$ ]] || { echo "not a release version: '$version'"; exit 1; }

# The package's SHA-256, or nothing yet.
checksum() {
  local sum
  sum=$(curl -fsSL "$DOWNLOADS/$version/speedrun-$version-$1.tar.gz.sha256" 2> /dev/null | cut -d ' ' -f 1) || return 1
  [[ $sum =~ ^[0-9a-f]{64}$ ]] && echo "$sum"
}
macos=$(checksum macos-arm64) || { echo "$version: its macOS package or checksum is not up yet"; exit 0; }
linux=$(checksum linux-x86_64) || { echo "$version: its Linux package or checksum is not up yet"; exit 0; }

cat > Formula/speedrun.rb <<EOF
# Written by update.sh for speedrun $version: edits here are overwritten.
class Speedrun < Formula
  desc "Fast black-box UI tests for Android and iOS, in plain YAML"
  homepage "https://github.com/$REPO"
  version "${version#v}"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "$DOWNLOADS/$version/speedrun-$version-macos-arm64.tar.gz"
      sha256 "$macos"
    end
  end

  on_linux do
    depends_on arch: :x86_64

    on_intel do
      url "$DOWNLOADS/$version/speedrun-$version-linux-x86_64.tar.gz"
      sha256 "$linux"
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
EOF
echo "Formula/speedrun.rb: speedrun $version"
