cask "swift-runtime-support" do
  version "061-41823-20191025-5efc5a59-d7dc-46d3-9096-396bb8cb4a73"
  sha256 "d5956aa3c543cdb6e0031f63c3d6a04b149e341c2dccfe917e794912015650ca"
  url "https://updates.cdn-apple.com/2019/cert/#{version}/SwiftRuntimeForCommandLineTools.dmg"

  name "Swift Runtime Support for Command Line Tools"
  desc "Starting with Xcode 10.2, Swift 5 command line programs you build require the Swift 5 runtime support libraries built into macOS. These libraries are included in the OS starting with macOS Mojave 10.14.4. When running on earlier versions of macOS, this package must be installed to provide the necessary Swift 5 libraries. This package is not necessary for apps with graphical user interfaces."
  homepage "https://support.apple.com/kb/dl1998"

  disable! date: "2019-03-25", because: "is unnecessary on macOS 10.14.4 and later"

  pkg "SwiftRuntimeForCommandLineTools.pkg"
  uninstall pkgutil: "com.apple.pkg.SwiftRuntimeForCommandLineTools"
end
