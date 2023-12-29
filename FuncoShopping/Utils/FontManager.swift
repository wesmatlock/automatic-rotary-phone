import SwiftUI

enum PrimaryTypeFace {
    case regular

    func font(size: CGFloat) -> Font {
        switch self {
        case .regular:
            return .custom("BungeeLayers-Regular", size: size)
        }
    }
}

enum SecondaryTypeFace {
    case regular, medium, semibold, bold

    func font(size: CGFloat) -> Font {
        switch self {
        case .regular:
            return .custom("Degular-Regular", size: size)
        case .medium:
            return .custom("Degular-Medium", size: size)
        case .semibold:
            return .custom("Degular-SemiBold", size: size)
        case .bold:
            return .custom("Degular-Bold", size: size)
        }
    }
}
