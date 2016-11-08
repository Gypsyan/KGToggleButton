# KGToggleButton

[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Cocoapods Compatible](https://img.shields.io/badge/KGToggleButton-swift3-brightgreen.svg)](https://img.shields.io/badge/KGToggleButton-swift3-brightgreen.svg)

`KGToggleButton` is a highlighted custom UIButton.

# Installation

## Cocoapods

Install Cocoapods if need be.

```bash
$ gem install cocoapods
```

Add `KGToggleButton` in your `Podfile`.

```ruby
use_frameworks!

pod 'KGToggleButton'
```

Then, run the following command.

```bash
$ pod install
```
## Carthage

Install Carthage if need be.

```bash
$ brew update
$ brew install carthage
```

Add `KGToggleButton` in your `Cartfile`.

```ruby
github "Gypsyan/KGToggleButton"
```

Run `carthage` to build the framework and drag the built `KGToggleButton.framework` into your Xcode project.

# Usage

Add a UIView to your Interface builder and set the class name as `KGToggleButton` in the `identity inspector`. Provide the module name as `KGToggleButton`.

Come to the `attribute inspector` and add the feature,

  * Outer line width
  * Inner Line Width
  * Outer Line color
  * Inner Line color
  * Shape - Circle or Rectangle
  * Fill color
  * on/off state

To use it from viewController,

```
let toggleButton = KGToggleButton(frame: CGRect(x: 185, y: 100, width: 50 , height: 50))
toggleButton.addTarget(self, action: #selector(action(_:)), for: .valueChanged)
toggleButton.shapeCircle = false
toggleButton.innerLineColor = UIColor.black
self.view.addSubview(toggleButton)
```
# License

Copyright 2016 Ananth.

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.
