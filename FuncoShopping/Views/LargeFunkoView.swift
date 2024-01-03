import SwiftUI

struct LargeFunkoView: View {
    @EnvironmentObject var mainViewModel: MainViewModel
    @State var animated = true

    let funko: Funko

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 24)
                .foregroundStyle(.backgroundNew)
                .shadow(color: .label.opacity(0.07), radius: 7, x: 1, y: 1)

            HStack {
                Image(funko.coverName)
                    .resizable()
                    .scaledToFit()
                    .scaleEffect(1.1)
                VStack(alignment: .leading) {
                    Text(funko.name)
                        .font(SecondaryTypeFace.bold.font(size: 20))

                    Text("$\(funko.price.clean(places: 2))")
                        .font(SecondaryTypeFace.semibold.font(size: 17))
                        .offset(y:8)
                        .foregroundStyle(.homeBlue)

                }
                .frame(maxWidth: 90)
                .offset(x: -12, y: -12)

                Spacer()
            }
            .offset(x: -24)
            .padding(8)
        }
        .offset(x: animated ? 0 : UIScreen.main.bounds.width * 0.15)
        .animation(.smooth(duration: 0.4, extraBounce: 0.1), value: animated)
        .onAppear() {
            animated = true
        }
    }
}

#Preview {
    LargeFunkoView(funko: MainViewModel().batmanFunko[2])
        .environmentObject(MainViewModel())
        .frame(width: UIScreen.main.bounds.width * 0.7, height: 180)
}
