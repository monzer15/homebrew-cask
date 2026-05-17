cask "zettlr" do
  on_macos do
    arch arm: "arm64", intel: "x64"
  end
  on_linux do
    arch arm: "arm64", intel: "x86_64"
  end

  url_end = on_system_conditional linux: ".AppImage", macos: ".dmg"

  version "4.5.0"
  sha256 arm:          "fd1e964378f4130703754ceee48ad99db57a5917e7d961af0e83ddf52d392a4b",
         intel:        "4ab3fde2ab4cc103797c2f74f035738c3f735e09bd1d5c16529bb5db64790ceb",
         x86_64_linux: "54ba039142f55ddc4c9dd0e7092706ad9fa61731d8d8168e92e410d28d7b5d2c",
         arm64_linux:  "5c43844b5c299ebddfbce39c4a3dd713fe9f3494a149f1aaf16e34658048a999"

  url "https://github.com/Zettlr/Zettlr/releases/download/v#{version}/Zettlr-#{version}-#{arch}#{url_end}",
      verified: "github.com/Zettlr/Zettlr/"
  name "Zettlr"
  desc "Open-source markdown editor"
  homepage "https://www.zettlr.com/"

  on_macos do
    depends_on macos: :monterey

    app "Zettlr.app"

    zap trash: [
      "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/com.zettlr.app.sfl*",
      "~/Library/Application Support/zettlr",
      "~/Library/Logs/Zettlr",
      "~/Library/Preferences/com.zettlr.app.plist",
      "~/Library/Saved Application State/com.zettlr.app.savedState",
    ]
  end

  on_linux do
    app_image "Zettlr-#{version}-#{arch}.AppImage", target: "Zettlr.AppImage"
  end
end
