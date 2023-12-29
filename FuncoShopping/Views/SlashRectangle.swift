import SwiftUI

struct SlashRectangle: Shape {

    func path(in rect: CGRect) -> Path {
        let cX = rect.midX
        let cY = rect.midY

        var path = Path()

        // The fill
        path.move(to: CGPoint (x: cX + 36.96, y: cY + 32.1))
        path.addLine(to: CGPoint (x: cX + -6.5, y: cY + 32.1))
        path.addCurve (to: CGPoint (x: cX + -15.03, y: cY + 29.97), control1: CGPoint (x: cX + -9.46, y: cY + 32.1), control2: CGPoint (x: cX + -12.32, y: cY + 31.38))
        path.addCurve (to: CGPoint (x: cX + -22.02, y: cY + 24.14), control1: CGPoint (x: cX + -17.64, y: cY + 28.6), control2: CGPoint (x: cX + -20, y: cY + 26.64))
        path.addCurve (to: CGPoint (x: cX + -26.76, y: cY + 15.46), control1: CGPoint (x: cX + -24.05, y: cY + 21.64), control2: CGPoint (x: cX + -25.64, y: cY + 18.72))
        path.addCurve (to: CGPoint (x: cX + -28.5, y: cY + 4.81), control1: CGPoint (x: cX + -27.91, y: cY + 12.09), control2: CGPoint (x: cX + -28.5, y: cY + 8.5))
        path.addCurve (to: CGPoint (x: cX + -26.76, y: cY + -5.85), control1: CGPoint (x: cX + -28.5, y: cY + 1.11), control2: CGPoint (x: cX + -27.91, y: cY + -2.47))
        path.addCurve (to: CGPoint (x: cX + -22.02, y: cY + -14.53), control1: CGPoint (x: cX + -25.64, y: cY + -9.1), control2: CGPoint (x: cX + -24.05, y: cY + -12.02))
        path.addCurve (to: CGPoint (x: cX + -15.03, y: cY + -20.36), control1: CGPoint (x: cX + -20, y: cY + -17.03), control2: CGPoint (x: cX + -17.64, y: cY + -18.99))
        path.addCurve (to: CGPoint (x: cX + -6.5, y: cY + -22.48), control1: CGPoint (x: cX + -12.32, y: cY + -21.77), control2: CGPoint (x: cX + -9.46, y: cY + -22.48))
        path.addLine(to: CGPoint (x: cX + 20.79, y: cY + -22.48))
        path.addCurve (to: CGPoint (x: cX + 24.46, y: cY + -9.99), control1: CGPoint (x: cX + 21.04, y: cY + -21.6), control2: CGPoint (x: cX + 21.87, y: cY + -18.77))
        path.addCurve (to: CGPoint (x: cX + 29.64, y: cY + 7.22), control1: CGPoint (x: cX + 25.82, y: cY + -5.36), control2: CGPoint (x: cX + 27.76, y: cY + 1.03))
        path.addCurve (to: CGPoint (x: cX + 36.96, y: cY + 32.1), control1: CGPoint (x: cX + 32.69, y: cY + 17.24), control2: CGPoint (x: cX + 36.42, y: cY + 29.52))

        path.closeSubpath()

        path.move(to: CGPoint (x: cX + 21.16, y: cY + -22.5))
        path.addLine(to: CGPoint (x: cX + 20.69, y: cY + -22.84))
        path.addLine(to: CGPoint (x: cX + 21.16, y: cY + -23.48))
        path.addLine(to: CGPoint (x: cX + 21.16, y: cY + -23.48))
        path.addLine(to: CGPoint (x: cX + 21.16, y: cY + -22.5))
        path.addLine(to: CGPoint (x: cX + 21.16, y: cY + -22.5))

        path.closeSubpath()

        path.move (to: CGPoint (x: cX + -6.5, y: cY + -21.98))
        path.addCurve (to: CGPoint (x: cX + -14.79, y: cY + -19.91), control1: CGPoint (x: cX + -9.37, y: cY + -21.98), control2: CGPoint (x: cX + -12.17, y: cY + -21.29))
        path.addCurve (to: CGPoint (x: cX + -21.63, y: cY + -14.21), control1: CGPoint (x: cX + -17.35, y: cY + -18.58), control2: CGPoint (x: cX + -19.65, y: cY + -16.66))
        path.addCurve (to: CGPoint (x: cX + -26.29, y: cY + -5.69), control1: CGPoint (x: cX + -23.63, y: cY + -11.75), control2: CGPoint (x: cX + -25.19, y: cY + -8.88))
        path.addCurve (to: CGPoint (x: cX + -28, y: cY + 4.81), control1: CGPoint (x: cX + -27.42, y: cY + -2.36), control2: CGPoint (x: cX + -28, y: cY + 1.17))
        path.addCurve (to: CGPoint (x: cX + -26.29, y: cY + 15.3), control1: CGPoint (x: cX + -28, y: cY + 8.45), control2: CGPoint (x: cX + -27.42, y: cY + 11.98))
        path.addCurve (to: CGPoint (x: cX + -21.63, y: cY + 23.83), control1: CGPoint (x: cX + -25.19, y: cY + 18.5), control2: CGPoint (x: cX + -23.63, y: cY + 21.37))
        path.addCurve (to: CGPoint (x: cX + -14.79, y: cY + 29.53), control1: CGPoint (x: cX + -19.65, y: cY + 26.27), control2: CGPoint (x: cX + -17.35, y: cY + 28.19))
        path.addCurve (to: CGPoint (x: cX + -6.5, y: cY + 31.6), control1: CGPoint (x: cX + -12.17, y: cY + 30.9), control2: CGPoint (x: cX + -9.37, y: cY + 31.6))
        path.addLine(to: CGPoint (x: cX + 36.33, y: cY + 31.6))
        path.addCurve (to: CGPoint (x: cX + 34.19, y: cY + 24.03), control1: CGPoint (x: cX + 36.07, y: cY + 30.53), control2: CGPoint (x: cX + 35.47, y: cY + 28.36))
        path.addCurve (to: CGPoint (x: cX + 29.16, y: cY + 7.36), control1: CGPoint (x: cX + 32.81, y: cY + 19.34), control2: CGPoint (x: cX + 30.95, y: cY + 13.25))
        path.addCurve (to: CGPoint (x: cX + 23.98, y: cY + -9.84), control1: CGPoint (x: cX + 27.28, y: cY + 1.18), control2: CGPoint (x: cX + 25.34, y: cY + -5.22))
        path.addCurve (to: CGPoint (x: cX + 20.41, y: cY + -21.98), control1: CGPoint (x: cX + 21.68, y: cY + -17.68), control2: CGPoint (x: cX + 20.77, y: cY + -20.78))
        path.addLine(to: CGPoint (x: cX + -6.5, y: cY + -21.98))
        path.closeSubpath()


        path.move(to: CGPoint (x: cX + 21.16, y: cY + -23))
        path.addLine(to: CGPoint (x: cX + 21.16, y: cY + -22.98))
        path.addLine(to: CGPoint (x: cX + 21.61, y: cY + -22.98))
        path.addCurve (to: CGPoint (x: cX + 21.16, y: cY + -22.98), control1: CGPoint (x: cX + 21.61, y: cY + -22.98), control2: CGPoint (x: cX + 21.5, y: cY + -22.98))
        path.addCurve (to: CGPoint (x: cX + 21.16, y: cY + -23), control1: CGPoint (x: cX + 21.16, y: cY + -23), control2: CGPoint (x: cX + 21.16, y: cY + -23))
        path.closeSubpath()

        path.move(to: CGPoint (x: cX + -6.5, y: cY + -22.98))
        path.addCurve (to: CGPoint (x: cX + 21.16, y: cY + -22.98), control1: CGPoint (x: cX + 13.73, y: cY + -22.98), control2: CGPoint (x: cX + 19.66, y: cY + -22.98))
        path.addCurve (to: CGPoint (x: cX + 24.94, y: cY + -10.13), control1: CGPoint (x: cX + 21.21, y: cY + -22.82), control2: CGPoint (x: cX + 21.65, y: cY + -21.31))
        path.addCurve (to: CGPoint (x: cX + 37.51, y: cY + 32.6), control1: CGPoint (x: cX + 29.02, y: cY + 3.77), control2: CGPoint (x: cX + 38.07, y: cY + 32.6))
        path.addLine(to: CGPoint (x: cX + -6.5, y: cY + 32.6))
        path.addCurve (to: CGPoint (x: cX + -29, y: cY + 4.81), control1: CGPoint (x: cX + -18.93, y: cY + 32.6), control2: CGPoint (x: cX + -29, y: cY + 20.15))
        path.addCurve (to: CGPoint (x: cX + -6.5, y: cY + -22.98), control1: CGPoint (x: cX + -29, y: cY + -10.54), control2: CGPoint (x: cX + -18.93, y: cY + -22.98))

        path.closeSubpath()

        return path
    }
}

#Preview {
    SlashRectangle()
        .foregroundStyle(.blue)
}
