import SwiftUI

enum FocusField: Hashable {
    case search
}

struct SearchView: View {
    @EnvironmentObject var mainViewModel: MainViewModel
    @FocusState private var focusedField: FocusField?

    var frameHeight: CGFloat = 56
    var searchPadding: CGFloat = 28

    var body: some View {
        GeometryReader { proxy in
            let width: CGFloat = proxy.frame(in: .global).width

            ZStack {
                Color.backgroundNew
                    .clipShape(RoundedRectangle(cornerRadius: 30))

                ZStack {
                    RoundedRectangle(cornerRadius: 30)
                        .stroke(style: StrokeStyle(lineWidth: 3, lineCap: .round))

                    ZStack {
                        RoundedRectangle(cornerRadius: 30)
                            .trim(from: 0.265, to: 0.8)
                            .offset(x: width * 0.12)
                            .foregroundStyle(.homeBlue)
                            .scaleEffect(0.95)
                            .frame(width: width * 0.4)
                            .animation(.smooth(duration: 0.4), value: mainViewModel.searchState)

                        Button {
                            readySearch()
                        } label: {
                            Image(systemName: "magnifyingglass")
                                .font(.system(size: 24, weight: .medium))
                        }
                        .buttonStyle(.plain)
                    }
                    .offset(x: -width / 2 + searchPadding)
                }
                .overlay(alignment: .trailing) {
                    if !mainViewModel.searchQuery.isEmpty {
                        CloseView()
                            .buttonStyle(.plain)
                            .frame(width: 24, height: 24)
                            .offset(x: -12)
                            .onTapGesture {
                                mainViewModel.reset()
                                UIApplication.shared.endEditing()
                            }
                    }
                }

                TextField("Search", text: $mainViewModel.searchQuery)
                    .safeAreaPadding(.horizontal, 20)
                    .font(SecondaryTypeFace.medium.font(size: 22))
                    .tracking(0.5)
                    .tint(.label)
                    .autocorrectionDisabled()
                    .textContentType(.username)
                    .textCase(.uppercase)
                    .focused($focusedField, equals: .search)
                    .padding(.horizontal, 50)
                    .padding(.trailing, -24)
            }
            .frame(height: frameHeight)
        }
    }

    func readySearch() {
        withAnimation(.smooth(duration: 0.5, extraBounce: 0.1)) {
            focusedField = .search
        }
    }

}

#Preview {
    SearchView()
        .environmentObject(MainViewModel())
        .padding(24)
}
