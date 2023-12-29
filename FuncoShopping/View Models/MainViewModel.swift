import SwiftUI
import Combine

enum SearchState {
    case inactive, searching, resultsReady
}

final class MainViewModel: ObservableObject {
    @Published var specialFunko: [Funko] = []
    @Published var popularFunko: [Funko] = []
    @Published var batmanFunko: [Funko] = []

    @Published var clothing: [Clothing] = []
    @Published var selectedFunko: Funko?
    @Published var displayedIndex: Int? = 0

    @Published var searchQuery = "" {
        didSet {
            if !searchQuery.isEmpty && oldValue.count < searchQuery.count {
                searchFunko()
            }
        }
    }

    @Published var searchState: SearchState = .inactive

    @Published var searchedFunko: [Funko] = []
    @Published var allFunkos: [Funko] = []
    @Published var checkedItems: [CheckedItem] = []

    @Published var totalAmount = 0.00
    @Published var totalQuantity = 0

    // -- Testing
    @Published var forTest = false

    init(forTest: Bool = false) {
        self.forTest = forTest

        self.specialFunko = fetchSpecialFunko()
        self.popularFunko = fetchPopularFunko()
        self.batmanFunko = fetchBatmanFunko()
        self.clothing = fetchClothing()

        self.allFunkos = specialFunko + batmanFunko + popularFunko

        guard !forTest else {
            self.checkedItems = [
                CheckedItem(name: "Aquaman Stealth", image: "aquaman-stealth", price: 12, isFunko: true),
                CheckedItem(name: "Joker 1989", image: "batman-joker", price: 15.99, isFunko: true)
            ]
            return
        }

        self.checkedItems = [
            CheckedItem(name: "Aquaman Stealth", image: "aquaman-stealth", price: 12, isFunko: true),
            CheckedItem(name: "Riddler", image: "riddler", price: 13.24)
        ]

        checkedItems.forEach { item in
            totalAmount += item.price
            totalQuantity += 1
        }
    }


    func searchFunko() {
        guard searchQuery.count >= 2 else {
            resetSearch()
            return
        }
    }

    func resetSearch() {
        withAnimation(.snappy) {
            searchState = .inactive
        }
    }

    func reset() {
        withAnimation(.smooth) {
            resetSearch()
            searchQuery = ""
            searchedFunko = []
        }
    }

    func addProductToCart() {
        guard let displayedIndex = displayedIndex else { return }

        let funko = searchedFunko[displayedIndex]

        // check if already in cart
        guard !checkedItems.contains(where: { $0.name == funko.name}) else {
            // TODO: -  maybe update quantity..
            return
        }

        totalAmount += funko.price
        totalQuantity += 1

        checkedItems.append(CheckedItem(name: funko.name, image: funko.coverName, price: funko.price, isFunko: true))
    }

    func deleteCheckedItem(_ item: CheckedItem) {
        withAnimation(.smooth){
            checkedItems = checkedItems.filter({ $0.id != item.id })
            totalAmount -= item.price
            totalQuantity -= 1
        }
    }

    func checkoutItemUpdate(_ item: CheckedItem, oldValue: Int, newValue: Int) {
        if item.quantity == 0 {
            totalAmount -= 1
            deleteCheckedItem(item)
        } else {
            withAnimation(.smooth) {
                totalAmount += item.price * Double(newValue - oldValue)
            }
        }
    }

    private func fetchSpecialFunko() -> [Funko] {
        let category: FunkoCategory = .batman

        return [
            Funko(name: "Batman Arkham Knight", price: 12.5, coverName: "batman-arkham", category: category),
            Funko(name: "Joker 1989", price: 12, coverName: "batman-joker", category: category),
            Funko(name: "BATMAN BEYOND", price: 15, coverName: "batman-beyond", category: category),
            Funko(name: "Batman Hush", price: 16, coverName: "batman-hush", category: category),
            Funko(name: "Batman", price: 14.5, coverName: "batman-retro", category: category),
        ]
    }

    @discardableResult
    private func fetchPopularFunko() -> [Funko] {
        let category: FunkoCategory = .specials

        return [
            Funko(name: "Aquaman Stealth", price: 12, coverName: "aquaman-stealth", category: category),
            Funko(name: "Flash Glow", price: 17, coverName: "flash-glow", category: category),
            Funko(name: "Nightwing", price: 15, coverName: "nightwing", category: category),
            Funko(name: "Captain Cold", price: 15, coverName: "cold-captain", category: category),
            Funko(name: "Storm", price: 17, coverName: "storm", category: category),
        ]
    }

    @discardableResult
    private func fetchBatmanFunko() -> [Funko] {     
        let category: FunkoCategory = .popular

        return [
            Funko(name: "Wonder Woman", price: 15, coverName: "wonder", category: category),
            Funko(name: "Harley Quinn", price: 18.15, coverName: "harley", category: category),
            Funko(name: "Sinestro", price: 14.44, coverName: "sinestro", category: category),
            Funko(name: "Peacemaker", price: 18.99, coverName: "peacemaker", category: category),
            Funko(name: "Dr. Fate", price: 12.49, coverName: "fate", category: category)

        ]
    }

    @discardableResult
    private func fetchClothing() -> [Clothing] {
        return [
            Clothing(name: "Vengeance", image: "vengeance", price: 14.41),
            Clothing(name: "Riddler", image: "riddler", price: 13.24),
            Clothing(name: "Joker", image: "joker", price: 16),
            Clothing(name: "Batman", image: "batman", price: 15),
        ]
    }
}
