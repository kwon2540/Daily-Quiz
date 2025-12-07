import AppUI
import ComposableArchitecture
import SwiftUI

// MARK: - View
@ViewAction(for: Login.self)
struct LoginView: View {
    @Bindable var store: StoreOf<Login>

    init(store: StoreOf<Login>) {
        self.store = store
    }

    var body: some View {
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
