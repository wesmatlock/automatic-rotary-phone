import SwiftUI

struct CheckoutView: View {
    @EnvironmentObject var mainViewModel: MainViewModel

    @Binding var cartOpened: Bool

    var body: some View {
        ZStack {
            Color.background
                .ignoresSafeArea(.all)

            VStack(alignment: .leading) {
                HStack {
                    Button {
                        cartOpened.toggle()
                    } label: {
                        Image(systemName: "arrow.left")
                    }
                    .frame(width: 44, height: 44)

                    Spacer()

                    Image(ImageConstants.dcLogo)
                        .resizable()
                        .frame(width: 80, height: 80)
                        .offset(x: -22)

                    Spacer()
                }
                .buttonStyle(.plain)
                .foregroundStyle(Color.label)
                .font(.system(size: 22, weight: .medium, design: .monospaced))

                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment: .leading) {
                        ViewBuilders.generateTitleView(title: "Checkout")
                            .padding(.top, 24)
                        
                        VStack(spacing: 18) {
                            ForEach(Array(zip(mainViewModel.checkedItems.indices, mainViewModel.checkedItems)), id: \.1.id) { index, CheckedItem in

                                CheckoutRowView(checkedItem: CheckedItem)
                                    .frame(height: 125)
                            }
                            .environmentObject(mainViewModel)
                        }
                        .padding(.top, 28)
                    }

                    Spacer()
                        .frame(height: 100)
                }
            }
            .padding(.horizontal, 24)
            .padding(.bottom, 88)
        }
        .overlay(alignment: .bottomLeading) {
            HStack {
                Text("Total: ")
                    .font(SecondaryTypeFace.semibold.font(size: 20))
                    .tracking(-0.5)

                Text("$\(mainViewModel.totalAmount.clean(places: 2))")
                    .font(PrimaryTypeFace.regular.font(size: 20))
            }
            .background {
                Circle()
                    .opacity(0.1)
                    .scaleEffect(CGSize(width: 18, height: 15))
                    .offset(x: -12, y: 100)
            }
            .padding(24)
        }
        .overlay(alignment: .bottomTrailing) {
            Button {

            } label: {
                Text("Buy now >")
                    .font(SecondaryTypeFace.semibold.font(size: 20))
            }
            .buttonStyle(.plain)
            .background {
                Circle()
                    .foregroundStyle(.homeBlue)
                    .contrast(0.8)
                    .scaleEffect(9)
                    .offset(x: 12, y: 24)
            }
            .padding(24)
        }
    }
}

#Preview {
    CheckoutView(cartOpened: .constant(false))
        .preferredColorScheme(.dark)
    .environmentObject(MainViewModel(forTest: true))}
