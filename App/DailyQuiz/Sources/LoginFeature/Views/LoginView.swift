import AppUI
import ComposableArchitecture
import SwiftUI

// MARK: - View
@ViewAction(for: Login.self)
public struct LoginView: View {
    @Bindable public var store: StoreOf<Login>

    public init(store: StoreOf<Login>) {
        self.store = store
    }

    public var body: some View {
        VStack {
            Text("Welcome to Login View")
                .font(.largeTitle)
                .padding()
        }
        .onAppear {
            send(.onAppear)
        }
    }
}
