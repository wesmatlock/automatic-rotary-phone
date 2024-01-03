import SwiftUI

struct CartButton: View {

    // MARK: - Variables
    @EnvironmentObject var mainViewModel: MainViewModel

    @Binding var cartOpened: Bool

    // MARK: - Views
    var body: some View {
        Button(action : {
            withAnimation(.smooth) {
                cartOpened.toggle()
            }
        }) {
            Image(systemName: "cart.fill")
                .font(.system(size: 28, weight: .semibold))
                .padding(4)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .foregroundColor(.label)
                        .frame(width: 26, height: 26)
                        .overlay(
                            Text("\(mainViewModel.totalQuantity)")
                                .foregroundColor(.homeBlue)
                                .font(PrimaryTypeFace.regular.font(size: 16))
                        )
                        .offset(x: 12, y: -26)
                        .opacity(self.mainViewModel.totalQuantity > 0 ? 1 : 0)
                        .animation(.default, value: self.mainViewModel.totalQuantity)
                )
        }
        .frame(width: 44, height: 44)
        .buttonStyle(PlainButtonStyle())
    }
}

#Preview {
    CartButton(cartOpened: .constant(false))
        .environmentObject(MainViewModel())
}
