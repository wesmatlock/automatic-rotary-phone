import SwiftUI

struct SmallClothingView: View {
    @EnvironmentObject var mainViewModel: MainViewModel
    @State var animated = false

    let clothing: Clothing

    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 24)
                    .foregroundStyle(.backgroundNeu)
                    .shadow(color: .label.opacity(0.05), radius: 7, x: 1, y: 1)
                Image(clothing.image)
                    .resizable()
                    .scaledToFit()
                    .padding(16)
            }

            Text(clothing.name)
                .font(SecondaryTypeFace.bold.font(size: 16))
                .frame(maxWidth: 85)
                .padding(.top, 4)
        }
        .offset(x: animated ? 0 : UIScreen.main.bounds.width * 0.125)
        .animation(.smooth(duration: 0.4, extraBounce: 0.1).delay(0.05), value: animated)
        .onAppear() {
            animated = true
        }
    }
}

#Preview {
    SmallClothingView(clothing: MainViewModel().clothing[1])
        .environmentObject(MainViewModel())
        .frame(width: UIScreen.main.bounds.width * 0.3, height: 160)
}
