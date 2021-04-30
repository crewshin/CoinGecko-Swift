![Repo image](https://github.com/crewshin/CoinGecko-Swift/blob/main/Resources/Logo.png)

# CoinGecko-Swift

![Build & Test](https://github.com/crewshin/CoinGecko-Swift/actions/workflows/build.yml/badge.svg)
[![License: MIT](https://img.shields.io/badge/License-MIT-brightgreen.svg)](https://github.com/crewshin/CoinGecko-Swift/blob/main/LICENSE)
[![swift-version](https://img.shields.io/badge/swift-5.1-brightgreen.svg)](https://github.com/apple/swift)

CoinGecko Swift SDK (Based off [https://www.coingecko.com/api/documentations/v3](https://www.coingecko.com/api/documentations/v3))

This is actively **WIP** at the moment. PR's welcome!


## Getting Started

#### Swift Package Manager (Xcode 11 and above)
1. Select `File`/`Swift Packages`/`Add Package Dependency` from the menu.
2. Paste `https://github.com/crewshin/CoinGecko-Swift.git`.

Why not CocoaPods, or Carthage?

Supporting multiple dependency managers makes maintaining a library exponentially more complicated and time consuming. Furthermore, with the integration of the Swift Package Manager in Xcode 11 and greater, I expect the need for alternative solutions to fade quickly.


## Usage

```swift
import CoinGecko
```


Create an instance of CoinGecko:

```swift
let gecko = CoinGecko(api: .main)
```

Then:

```swift
gecko.ping() { (result) in
    switch result {
    case .failure(let error):
        if case let APIError.generic(message) = error {
            print(message)
        }
    case .success(let response):
        if let value = response.value {
            print(value)
        }
    }
}

```



Feel free to say hi on Discord: `crewshin#3286`

