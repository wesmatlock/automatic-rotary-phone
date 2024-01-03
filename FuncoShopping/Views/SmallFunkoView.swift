import SwiftUI

struct SmallFunkoView: View {
    @EnvironmentObject var mainViewModel: MainViewModel
    @State var animated = false

    let funko: Funko

    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 24)
                    .foregroundStyle(.backgroundNew)
                    .shadow(color: .label.opacity(0.05), radius: 7, x: 1, y: 1)

                Image(funko.coverName)
                    .resizable()
                    .scaledToFit()
                    .scaleEffect(1.4)
                    .padding(14)
            }

            Text(funko.name)
                .font(SecondaryTypeFace.semibold.font(size: 16))
                .padding(.top, 4)
        }
        .offset(x: animated ? 0 : UIScreen.main.bounds.width * 0.135)
        .animation(.smooth(duration: 0.4, extraBounce: 0.1).delay(0.2), value: animated)
        .onAppear() {
            animated = true
        }
    }
}

#Preview {
    SmallFunkoView(funko: MainViewModel().popularFunko[1])
        .environmentObject(MainViewModel())
        .frame(width: UIScreen.main.bounds.width * 0.3, height: 190)
}
