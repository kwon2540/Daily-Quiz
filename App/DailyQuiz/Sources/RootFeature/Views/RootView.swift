import AppUI
import ComposableArchitecture
import LaunchFeature
import LoginFeature
import SwiftUI

// MARK: - View
@ViewAction(for: Root.self)
public struct RootView: View {
    @Bindable public var store: StoreOf<Root>

    public init(store: StoreOf<Root>) {
        self.store = store
    }

    public var body: some View {
        Group {
            switch store.destination {
            case .launch:
                if let store = store.scope(
                    state: \.destination?.launch,
                    action: \.destination.launch
                ) {
                    LaunchView(store: store)
                }

            case .login:
                if let store = store.scope(
                    state: \.destination?.login,
                    action: \.destination.login
                ) {
                    LoginView(store: store)
                }

            case .none:
                EmptyView()
            }
        }
        .onAppear {
            send(.onAppear)
        }
    }
}
