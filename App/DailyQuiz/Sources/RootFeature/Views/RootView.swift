import AppUI
import ComposableArchitecture
import SwiftUI

// MARK: - View
@ViewAction(for: Root.self)
public struct RootView: View {
    @Bindable public var store: StoreOf<Root>

    public init(store: StoreOf<Root>) {
        self.store = store
    }

    public var body: some View {
        VStack {
            Text("Welcome to Root View")
                .font(.largeTitle)
                .padding()
        }
        .onAppear {
            send(.onAppear)
        }
    }
}
