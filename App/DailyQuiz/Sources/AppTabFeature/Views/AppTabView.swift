import AppUI
import ComposableArchitecture
import SwiftUI

// MARK: - View
@ViewAction(for: AppTab.self)
public struct AppTabView: View {
    @Bindable public var store: StoreOf<AppTab>

    public init(store: StoreOf<AppTab>) {
        self.store = store
    }

    public var body: some View {
        VStack {
            Text("Welcome to AppTab View")
                .font(.largeTitle)
                .padding()
        }
        .onAppear {
            send(.onAppear)
        }
    }
}
