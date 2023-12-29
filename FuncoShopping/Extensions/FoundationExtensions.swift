import Foundation

extension Int {
    func appendZeros() -> String {
        if self < 10 {
            return "0\(self)"
        } else {
            return "\(self)"
        }
    }

    func degreeToRadians() -> CGFloat {
        (CGFloat(self) * .pi) / 180
    }

    func toPhoneNumber() -> String {
        let stringNumber = "\(self)"
        return stringNumber.prefix(5) + "-" + stringNumber.suffix(5)
    }
}

extension CGFloat {
    func clean(places: Int) -> String {
        String(format: "%.\(places)", self)
    }

    func toDouble() -> Double {
        Double(self)
    }
}

extension Double {
    func convert(fromRange: (Double, Double), toRange: (Double, Double)) -> Double {
        var value = self
        value -= fromRange.0
        value /= Double(fromRange.1 - fromRange.0)
        value *= toRange.1 - toRange.0
        value += toRange.0
        return value
    }

    func clean(places: Int) -> String {
        String(format: "%, \(places)", self)
    }
}
