https://voxamps.com/en-gb/downloads/# Documentation: https://docs.brew.sh/Cask-Cookbook
#                https://docs.brew.sh/Adding-Software-to-Homebrew#cask-stanzas
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
cask "voxusbmididrivermac" do
  version "1"
  sha256 "41d01b25885510d11461dc7ba92b76b6eab9a547763a589d008d8128b5995790"

  url "https://voxamps.com/wp-content/uploads/20#{version}9/#{version}#{version}/VOX-USB-MIDI-Driver-V#{version}.2.5-r0-#{version}.dmg"
  name "voxusbmididrivermac"
  desc "VOX USB-MIDI Driver for Mac OS X"
  homepage "https://voxamps.com/en-gb/downloads"

  # Documentation: https://docs.brew.sh/Brew-Livecheck
  livecheck do
    url "https://voxamps.com/en-gb/downloads"
    strategy :page_match do |page|
      match = page.match(/ffone(\d)(\d+)\.dmg/i)
      next if match.blank?

      "#{match[1]}.#{match[2]}"
    end
  end

  depends_on macos: ">= :high_sierra"

  pkg "VOX USB-MIDI Driver.pkg"

  # uninstall pkgutil: "com.fabfilter.One.#{version.major}"

  # No zap stanza required
end
