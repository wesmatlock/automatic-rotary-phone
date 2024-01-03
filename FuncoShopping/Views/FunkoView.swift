import SwiftUI

struct FunkoView: View {
    @EnvironmentObject var mainViewModel: MainViewModel
    @State var animate = true

    var funk0: Funko
    let id: Int

    var body: some View {
        VStack {
            Image(funk0.coverName)
                .resizable()
                .scaledToFit()
                .offset(x: animate ? 0 : UIScreen.main.bounds.width * 0.15)
                .animation(.smooth(duration: 0.4, extraBounce: 0.1), value: animate)

            Text(funk0.name)
                .font(SecondaryTypeFace.semibold.font(size: 24))
                .textCase(.uppercase)
                .lineLimit(1)
                .kerning(-0.1)
                .padding(.top, -8)

            Text("$\(funk0.price.clean(places: 2))")
                .font(SecondaryTypeFace.bold.font(size: 24))
                .foregroundStyle(.homeBlue)
                .brightness(-0.1)
                .padding(.top, -12)
        }
        .onAppear() {
            animate = true
        }
    }
}

#Preview {
    FunkoView(funk0: MainViewModel().batmanFunko[0], id: 0)
        .environmentObject(MainViewModel())
        .preferredColorScheme(.dark)
}
