import SwiftUI

struct CheckoutRowView: View {
    @EnvironmentObject var mainViewModel: MainViewModel
    @ObservedObject var checkedItem: CheckedItem

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundStyle(.backgroundNew)
                .shadow(color: .label.opacity(0.035), radius: 7, x: 0, y: 1)

            HStack(spacing: 24) {
                Image(checkedItem.image)
                    .resizable()
                    .scaledToFit()
                    .scaleEffect(checkedItem.isFunko ? 1.23 : 0.95)
                    .offset(x: checkedItem.isFunko ? -13 : 0)

                VStack(alignment: .leading) {
                    Text(checkedItem.name)
                        .font(SecondaryTypeFace.semibold.font(size: 19))

                    Text("$\(checkedItem.price.clean(places: 2))")
                        .font(SecondaryTypeFace.medium.font(size: 16))
                        .foregroundStyle(.homeBlue)
                        .brightness(-0.1)
                        .padding(.top, -12)
                }
                .offset(x: checkedItem.isFunko ? -20 : 0)

                Spacer()
            }
            .padding(20)
        }
        .overlay(alignment: .bottomTrailing) {
            generateStepperView()
                .scaleEffect(0.85)
                .frame(width: UIScreen.main.bounds.width * 0.375)
                .padding(10)
                .offset(x: 24)
        }
        .onChange(of: checkedItem.quantity) { oldValue, newValue in
            print("newValue: \(newValue)")
            mainViewModel.checkoutItemUpdate(checkedItem, oldValue: oldValue, newValue: newValue)
        }
    }

    @ViewBuilder
    func generateStepperView() -> some View {
        HStack(spacing: 0) {
            Button {
                withAnimation(.smooth) {
                    checkedItem.decreaseQuantity()
                }
            } label: {
                Image(systemName: "minus")
                    .font(.system(size: 11, weight: .medium))
            }
            .frame(width: 28, height: 28)
            .background {
                RoundedRectangle(cornerRadius: 4)
                    .foregroundStyle(Color.label)
                    .opacity(0.025)
            }
            .onTapGesture {
                withAnimation(.smooth) {
                    checkedItem.decreaseQuantity()
                }
            }
            .zIndex(5)

            Text("\(checkedItem.quantity)")
                .font(SecondaryTypeFace.medium.font(size: 18))
                .padding(16)
                .frame(height: 28)
                .background {
                    Rectangle()
                        .foregroundStyle(.backgroundNew)
                }

            Button {
                withAnimation(.smooth) {
                    checkedItem.increaseQuantity()
                }

            } label: {
                Image(systemName: "plus")
                    .font(.system(size: 11, weight: .medium))
            }
            .frame(width: 28, height: 28)
            .background {
                RoundedRectangle(cornerRadius: 4)
                    .foregroundStyle(Color.label)
                    .opacity(0.025)
            }
        }
        .buttonStyle(.plain)
        .padding(.horizontal, 12)
    }
}

#Preview {
    ZStack {
        Color.background
            .ignoresSafeArea()

        CheckoutRowView(checkedItem: MainViewModel(forTest: true).checkedItems[1])
            .environmentObject(MainViewModel())
            .frame(height: 130)
            .padding(24)
    }}
