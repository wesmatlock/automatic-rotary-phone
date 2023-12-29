import SwiftUI

struct CartButton: View {
    @EnvironmentObject var mainViewModel: MainViewModel
    @Binding var cartOpened: Bool

    var body: some View {
        Button {
            withAnimation(.smooth) {
                cartOpened.toggle()
            }
        } label: {
            Image(systemName: "cart.fill")
                .font(.system(size: 28, weight: .semibold))
                .padding(4)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
//                        .foregroundStyle(.label)
                )
        }
    }
}

#Preview {
    CartButton(cartOpened: .constant(false))
        .environmentObject(MainViewModel())
}
