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
    