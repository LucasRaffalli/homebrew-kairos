cask "kairos" do
  version "0.1.0"
  sha256 "aad7ddb26f2d1c73caf2b287f514804a45abb2c43f15c4ea426ef223e5c2f7c7"

  url "https://release.lucasraffalli.com/kairos/Kairos_#{version}_aarch64.dmg"
  name "Kairos"
  desc "Chronomètre de barre de menus pour Monday"
  homepage "https://github.com/LucasRaffalli/kairos"

  # L'app embarque son propre updater : brew upgrade n'a rien à faire.
  auto_updates true
  depends_on arch: :arm64

  app "Kairos.app"

  # App non notarisée : sans ça, Gatekeeper affiche « Kairos est endommagé ».
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Kairos.app"]
  end

  uninstall quit: "com.aegis.kairos"

  zap trash: [
    "~/Library/Application Support/com.aegis.kairos",
    "~/Library/Caches/com.aegis.kairos",
    "~/Library/Preferences/com.aegis.kairos.plist",
    "~/Library/Saved Application State/com.aegis.kairos.savedState",
    "~/Library/WebKit/com.aegis.kairos",
  ]
end
