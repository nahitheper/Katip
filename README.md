# Katip

[![CI Status](http://img.shields.io/travis/nahitheper@gmail.com/Katip.svg?style=flat)](https://travis-ci.org/nahitheper@gmail.com/Katip)
[![Version](https://img.shields.io/cocoapods/v/Katip.svg?style=flat)](http://cocoapods.org/pods/Katip)
[![License](https://img.shields.io/cocoapods/l/Katip.svg?style=flat)](http://cocoapods.org/pods/Katip)
[![Platform](https://img.shields.io/cocoapods/p/Katip.svg?style=flat)](http://cocoapods.org/pods/Katip)

Katip is a tiny logging framework for iOS. Katip allows you to log details to the console, just like you would have with NSLog() or print(), but with additional information such as, the date, log level, thread name, dynamic type, function name, filename and line number.

## Example

To use Katip in the entire project, simply add it to the `AppDelegate.swift` file. 
To be able to run the example project, you must first clone the repo and run `pod install` from the Example directory.

```swift
import Katip
let log = Katip.self
```

You can set the log format or enable/disable console outputs in the beginning of your AppDelegate:didFinishLaunchingWithOptions() 

```swift
log.formatText = "$L➤$DHH:mm:ss {$T} $F.$f.[$l]<$t>:$O"
log.enabled = true
```
#### Format text parameters
```
O output object
T thread name
t object dynamic type
F file name
f function name
l line number
D date with format
L log level 
```

## Installation

Katip is available through [CocoaPods](http://cocoapods.org). 
Installation is very simple just add the following line to your Podfile.

```ruby
pod "Katip"
```

## Author

[Nahit Rüştü Heper](mailto:nahitheper@gmail.com)

## License

Katip is available under the MIT license. See the LICENSE file for more info.
