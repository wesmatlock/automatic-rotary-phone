import SwiftUI

struct MainView: View {
    @StateObject var mainViewModel = MainViewModel(forTest: false)
    @State var cartOpened = false

    var body: some View {
        GeometryReader { proxy in
            let width: CGFloat = proxy.size.width

            ZStack(alignment: Alignment(horizontal: .leading, vertical: .top)) {
                Color.background
                    .ignoresSafeArea()

                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment: .leading) {
                        HStack {
                            Button {

                            } label: {
                                Image(systemName: "arrow.left")
                            }
                            .frame(width: 44, height: 44)

                            Spacer()

                            Image(ImageConstants.dcLogo)
                                .resizable()
                                .frame(width: 80, height: 80)

                            Spacer()

                            CartButton(cartOpened: $cartOpened)
                        }
                        .buttonStyle(.plain)
                        .foregroundStyle(Color.label)
                        .font(.system(size: 22, weight: .medium, design: .monospaced))

                        SearchView(frameHeight: 48)
                            .fixedSize(horizontal: false, vertical: true)
                            .padding(12)
                            .frame(height: 48)

                        switch mainViewModel.searchState {

                        case .inactive:
                            ViewBuilders.generateTitleView(title: "Today's Special")
                                .padding(.top, 56)

                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 24) {
                                    ForEach(Array(zip(mainViewModel.specialFunko.indices, mainViewModel.specialFunko)), id: \.1.id) { (ix, funko) in
                                        LargeFunkoView(funko: funko)
                                            .frame(width: width * 0.7, height: 190)
                                    }
                                }
                                .scrollTargetLayout()
                            }
                            .padding(.trailing, -24)
                            .scrollTargetBehavior(.viewAligned(limitBehavior: .always))
                            .padding(.top, 16)

                            HStack {
                                ViewBuilders.generateTitleView(title: "Clothing")
                                Spacer()
                                generateSeeAllView()
                            }
                            .padding(.top, 38)

                            ScrollView(.horizontal, showsIndicators: false) {
                                LazyHStack(alignment: .top, spacing: 20) {
                                    ForEach(Array(zip(mainViewModel.clothing.indices, mainViewModel.clothing)), id: \.1.id) { (ix, clothing) in
                                        SmallClothingView(clothing: clothing)
                                            .frame(width: width * 0.3, height: 160)
                                    }
                                }
                                .padding(.top, 12)
                            }
                            .padding(.trailing, -24)

                            HStack {
                                ViewBuilders.generateTitleView(title: "Popular")
                                Spacer()
                                generateSeeAllView()
                            }
                            .padding(.top, 38)

                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(alignment: .top, spacing: 20) {
                                    ForEach(Array(zip(mainViewModel.popularFunko.indices, mainViewModel.popularFunko)), id: \.1.id) { (ix, funko) in
                                        SmallFunkoView(funko: funko)
                                            .frame(width: width * 0.3, height: 190)
                                    }
                                }
                                .padding(.top, 12)
                            }
                            .padding(.trailing, -24)

                        case .searching:
                            FunkoView(funk0: mainViewModel.batmanFunko[0], id: 0)
                                .redacted(reason: .placeholder)
                                .scaleEffect(1.05)
                                .padding(12)
                                .padding(.top, 76)
                                .clipShape(RoundedRectangle(cornerRadius: 8))

                        case .resultsReady:
                            FunkoScrollView(width: width)
                                .scaleEffect(1.05)
                                .padding(.top, 24)
                        }
                    }
                    .padding(.horizontal, 24)
                }
                .scrollDisabled(mainViewModel.searchState == .resultsReady ? true : false)
                .overlay(alignment: .bottom) {
                    Button {
                        mainViewModel.addProductToCart()
                    } label: {
                        Image(systemName: "cart.badge.plus")
                            .font(.system(size: 30, weight: .semibold))
                            .offset(y: -24)
                    }
                    .buttonStyle(.plain)
                    .background {
                        Circle()
                            .foregroundStyle(.homeBlue)
                            .contrast(0.8)
                            .scaleEffect(5.5)
                    }
                    .offset(x: 7, y: 14)
                    .opacity(mainViewModel.searchState == .resultsReady ? 1 : 0)
                }
                .offset(x: cartOpened ? -width : 0)
                .animation(.snappy, value: cartOpened)

                CheckoutView(cartOpened: $cartOpened)
                    .ignoresSafeArea(.keyboard, edges: .bottom)
                    .offset(x: !cartOpened ? width : 0)
                    .opacity(!cartOpened ? 0 : 1)
                    .animation(.snappy, value: cartOpened)

            }
        }
        .environmentObject(mainViewModel)
    }

    @ViewBuilder
    func generateSeeAllView() -> some View {
        HStack {
            Text("See all")
                .font(SecondaryTypeFace.medium.font(size: 16))
            Image(systemName: "chevron.right")
                .font(.system(size: 11, weight: .semibold))
        }
        .foregroundColor(.homeBlue)
    }
}

#Preview {
    MainView()
        .preferredColorScheme(.dark)
}
