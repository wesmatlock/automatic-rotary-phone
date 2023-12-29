import Foundation

final class CheckedItem: ObservableObject, Identifiable {
    let id: String

    let name: String
    let image: String
    let price: Double

    let isFunko: Bool

    @Published var quantity: Int = 1

    init(name: String, image: String, price: Double, isFunko: Bool = false) {
        self.id = UUID().uuidString

        self.name = name
        self.image = image
        self.price = price
        self.isFunko = isFunko
    }

    func increaseQuantity(_ amount: Int = 1) {
        quantity += amount
    }

    func decreaseQuantity(_ amount: Int = 1) {
        guard quantity - amount  >= 0 else {
            // Do something since there could be inventory just the amount
            return
        }

        quantity -= amount

        if quantity == 0 {
            // do something..
        }
    }
}
