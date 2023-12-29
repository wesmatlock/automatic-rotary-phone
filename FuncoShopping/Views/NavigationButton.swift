import SwiftUI

struct NavigationButton: View {
    @State var lineWidth: CGFloat = 0
    @State var smallerLineWidth: CGFloat = 0

    let color: Color
    let buttonAction: () -> ()

    var body: some View {
        ZStack {
            Button {

            } label: {
                VStack(alignment: .leading) {
                    Capsule(style: .continuous)
                        .frame(width: lineWidth, height: 3)
                    Capsule(style: .continuous)
                        .frame(width: smallerLineWidth, height: 3)
                }
            }
            .foregroundStyle(color)
            .onAppear() {
                withAnimation(.snappy(duration: 0.3, extraBounce: 0.1)) {
                    lineWidth = 40
                }
                Timer.scheduledTimer(withTimeInterval: 0.25, repeats: false) { _ in
                    withAnimation(.bouncy(duration: 0.3, extraBounce: 0.2)) {
                        smallerLineWidth = 18
                    }

                }
            }
        }
        .frame(width: 44, height: 44, alignment: .leading)
    }
}

#Preview {
    NavigationButton(color: .black, buttonAction: {})
}
