import SwiftUI

struct CloseView: View {
    @State var upperOpacity: Double = 0
    @State var rotationDegrees: Angle = .degrees(-90)
    @State var lowerRotationDegrees: Angle = .degrees(2)
    @State var closeOpacity: Double = 0

    var animationDuration: TimeInterval = 0.25
    var buttonAction: () -> () = {}

    var body: some View {
        GeometryReader { proxy in
            let width = proxy.size.width
            let height = proxy.size.height

            ZStack {
                RoundedRectangle(cornerRadius: 2)
                    .fill(Color.label.opacity(0.5))
                    .frame(width: width / 10, height: height)
                    .opacity(upperOpacity)
                    .rotationEffect(lowerRotationDegrees)
                RoundedRectangle(cornerRadius: 2)
                    .fill(Color.label)
                    .frame(width: width / 10, height: height)
                    .rotationEffect(rotationDegrees)
            }
            .offset(x: width / 2)
            .opacity(closeOpacity)

            .onAppear() {
                animateClose()
            }
        }
    }

    func delete() {
        withAnimation(.default) {
            lowerRotationDegrees = .degrees(-90)
        }
    }

    func closeBack() {
        withAnimation(.default) {
            rotationDegrees = .degrees(-90)
            closeOpacity = 0
            upperOpacity = 0
            lowerRotationDegrees = .degrees(3)
        }
    }

    func animateClose() {
        withAnimation(.easeInOut(duration: animationDuration)) {
            rotationDegrees = .degrees(135)
            closeOpacity = 1
        }

        Timer.scheduledTimer(withTimeInterval: animationDuration / 4, repeats: false) { _ in
            withAnimation(.spring()) {
                upperOpacity = 1
            }
        }

        Timer.scheduledTimer(withTimeInterval: animationDuration / 2, repeats: false) { _ in
            withAnimation(.easeInOut(duration: animationDuration / 2)) {
                lowerRotationDegrees = .degrees(223)
            }
        }
    }
}

#Preview {
    CloseView()
        .frame(width: 44, height: 44)
}
