import SwiftUI

struct ViewBuilders {
    @ViewBuilder
    static func generateTitleView(title: String) -> some View {
        Text(title)
            .font(PrimaryTypeFace.regular.font(size: 24))
            .tracking(-0.5)
            .textCase(.uppercase)
    }
}
