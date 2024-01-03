import SwiftUI

struct FunkoScrollView: View {
    @EnvironmentObject var mainViewModel: MainViewModel

    let width: CGFloat

    var isPlaceholder = false
    var placeholderFunkos: [Funko] = []

    var body: some View {
        ScrollViewReader{ scrollView in
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack {
                    ForEach(Array(zip(isPlaceholder ? placeholderFunkos.indices : mainViewModel.searchedFunko.indices, isPlaceholder ? placeholderFunkos : mainViewModel.searchedFunko)), id: \.1.id) { index, funko in
                        
                        FunkoView(funk0: funko, id: index)
                            .frame(width: width)
                            .id(index)
                    }
                }
                .scrollTargetLayout()
            }
            .scrollTargetBehavior(.viewAligned(limitBehavior: .automatic))
            .scrollPosition(id: $mainViewModel.displayedIndex)
            .padding(.horizontal, -20)
        }
    }
}

#Preview {
    FunkoScrollView(width: 425)
        .environmentObject(MainViewModel())
}
