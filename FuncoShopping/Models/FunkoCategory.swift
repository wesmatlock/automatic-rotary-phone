import Foundation

enum FunkoCategory {
    case batman
    case aquaman
    case flash
    case specials
    case popular
}

struct Funko: Identifiable, Hashable {
    var id: String
    var name: String
    var price: Double
    var coverName: String
    let category: FunkoCategory

    init(name: String, price: Double, coverName: String, category: FunkoCategory) {
        self.id = UUID().uuidString
        self.name = name
        self.price = price
        self.coverName = coverName
        self.category = category
    }
}
