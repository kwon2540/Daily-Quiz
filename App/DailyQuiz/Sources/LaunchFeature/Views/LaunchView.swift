import AppUI
import ComposableArchitecture
import SwiftUI

// MARK: - View
@ViewAction(for: Launch.self)
struct LaunchView: View {
    @Bindable var store: StoreOf<Launch>

    init(store: StoreOf<Launch>) {
        self.store = store
    }

    var body: some View {
        VStack {
            Text("Welcome to Launch View")
                .font(.largeTitle)
                .padding()
        }
        .onAppear {
            send(.onAppear)
        }
    }
}
