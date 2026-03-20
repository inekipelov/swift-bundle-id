# BundleID

`BundleID` is a small Swift Package that exposes strongly typed bundle
identifiers backed by `Tagged`.

The repository and package identity stay `swift-bundle-id`, while the framework
you import is `BundleID`.

<p align="center">
  <a href="https://swift.org"><img src="https://img.shields.io/badge/Swift-6.0+-F05138?logo=swift&logoColor=white" alt="Swift 6.0+"></a>
  <a href="https://developer.apple.com"><img src="https://img.shields.io/badge/iOS-13.0+-000000?logo=apple" alt="iOS 13.0+"></a>
  <a href="https://developer.apple.com"><img src="https://img.shields.io/badge/macOS-10.15+-000000?logo=apple" alt="macOS 10.15+"></a>
  <a href="https://developer.apple.com"><img src="https://img.shields.io/badge/tvOS-13.0+-000000?logo=apple" alt="tvOS 13.0+"></a>
  <a href="https://developer.apple.com"><img src="https://img.shields.io/badge/watchOS-6.0+-000000?logo=apple" alt="watchOS 6.0+"></a>
  <a href="https://developer.apple.com/visionos/"><img src="https://img.shields.io/badge/visionOS-1.0+-000000?logo=apple" alt="visionOS 1.0+"></a>
</p>

## Installation

Add the package to your `Package.swift` dependencies:

```swift
.package(url: "https://github.com/inekipelov/swift-bundle-id.git", from: "0.1.0")
```

Then add `BundleID` to your target dependencies:

```swift
.target(
    name: "YourTarget",
    dependencies: [
        "BundleID"
    ]
)
```

## Usage

`BundleID` wraps Foundation's `Bundle.bundleIdentifier`, which is a `String?`
defined by the `CFBundleIdentifier` key in a bundle's Info.plist.

```swift
import Foundation
import BundleID

let bundleID = Bundle.main.bundleID
print(bundleID)           // BundleID(rawValue: "com.example.my-app")
print(bundleID.rawValue)  // com.example.my-app

func acceptsBundleID(_ id: BundleID) {
    print("Tracking bundle:", id.rawValue)
}

acceptsBundleID(Bundle.main.bundleID)

let isCurrentApp = bundleID == Bundle.main.bundleID
print(isCurrentApp) // true
```
