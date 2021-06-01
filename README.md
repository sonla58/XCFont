```
'##::::'##::'######::'########::'#######::'##::: ##:'########:
. ##::'##::'##... ##: ##.....::'##.... ##: ###:: ##:... ##..::
:. ##'##::: ##:::..:: ##::::::: ##:::: ##: ####: ##:::: ##::::
::. ###:::: ##::::::: ######::: ##:::: ##: ## ## ##:::: ##::::
:: ## ##::: ##::::::: ##...:::: ##:::: ##: ##. ####:::: ##::::
: ##:. ##:: ##::: ##: ##::::::: ##:::: ##: ##:. ###:::: ##::::
 ##:::. ##:. ######:: ##:::::::. #######:: ##::. ##:::: ##::::
..:::::..:::......:::..:::::::::.......:::..::::..:::::..:::::
```

[![GitHub issues](https://img.shields.io/github/issues/sonla58/XCFont?style=flat-square)](https://github.com/sonla58/XCFont/issues)
[![GitHub license](https://img.shields.io/github/license/sonla58/XCFont?style=flat-square)](https://github.com/sonla58/XCFont/blob/trunk/LICENSE)

# XCFont

A small command-line tool helps you work with custom font in the XCode project.

# Requirement

- [pip](https://pypi.org/project/pip/) version 21 or above
- Python 3.7 or above
- For iOS Example project, required Xcode 12.2 and Swift 5

# Feature

- [x] Support `.ttf` font file.
- [x] Generated plist source code to add custom fonts to Xcode project in Info.plist file.
- [x] Generated `swift` code to define font name in `enum`
- [x] Generated convenient `swift` code to get `UIFont` for `UIKit`.
- [x] Generated convenient `swift` code to get `Font` for `SwiftUI`.

# Installation

## 1. Use PyPI

```
pip install xcfont
```

## 2. Manual

Use [poetry](https://python-poetry.org/docs/) to run or build Python source code in [here](./xcfont).

# Usage

1. Add your custom font file (in .ttf format) to Xcode project.
2. Use `xcfont` to generate convenient code.
3. Copy content `{output_dir}/xcfont_out/plist.xml` to Info.plist.
4. Copy content `{output_dir}/xcfont_out/FontName.swift` to somewhere in your project or directly put it in your project.

Example output file:

plist.xml
```xml
<key>UIAppFonts</key>
<array>
	<string>Avenir-LightOblique-08.ttf</string>
	<string>Avenir-BookOblique-02.ttf</string>
	<string>Avenir-Book-01.ttf</string>
	<string>Avenir-Oblique-11.ttf</string>
	<string>Avenir-Heavy-05.ttf</string>
	<string>Avenir-BlackOblique-04.ttf</string>
	<string>Avenir-Light-07.ttf</string>
	<string>Avenir-Roman-12.ttf</string>
	<string>Avenir-Black-03.ttf</string>
	<string>Avenir-HeavyOblique-06.ttf</string>
	<string>Avenir-MediumOblique-10.ttf</string>
	<string>Avenir-Medium-09.ttf</string>
</array>
```

FontName.swift
```swift
import UIKit
    
enum FontName: String {
	case avenirLightOblique = "Avenir Light Oblique"
	case avenirBookOblique = "Avenir Book Oblique"
	case avenirBook = "Avenir Book"
	case avenirOblique = "Avenir Oblique"
	case avenirHeavy = "Avenir Heavy"
	case avenirBlackOblique = "Avenir Black Oblique"
	case avenirLight = "Avenir Light"
	case avenirRoman = "Avenir Roman"
	case avenirBlack = "Avenir Black"
	case avenirHeavyOblique = "Avenir Heavy Oblique"
	case avenirMediumOblique = "Avenir Medium Oblique"
	case avenirMedium = "Avenir Medium"
}

extension FontName {
    func asUIFont(size: CGFloat) -> UIFont? {
        UIFont(name: rawValue, size: size)
    }
}

#if canImport(SwiftUI)
import SwiftUI

extension FontName {
    func asFont(size: CGFloat) -> Font {
        Font.custom(rawValue, size: size)
    }
    
    func asFont(fixedSize: CGFloat) -> Font {
        Font.custom(rawValue, fixedSize: fixedSize)
    }
    
    func asFont(size: CGFloat, relativeTo: Font.TextStyle) -> Font {
        Font.custom(rawValue, size: size, relativeTo: relativeTo)
    }
}
#endif
```
