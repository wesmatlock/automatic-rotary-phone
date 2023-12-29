import Foundation

struct Clothing: Identifiable {
    let name: String
    let image: String
    let price: Double
    let id: String

    init(name: String, image: String, price: Double) {
        self.name = name
        self.image = image
        self.price = price
        self.id = UUID().uuidString
    }
}
