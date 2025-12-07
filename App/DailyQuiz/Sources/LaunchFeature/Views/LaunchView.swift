import AppUI
import ComposableArchitecture
import SwiftUI

// MARK: - View
@ViewAction(for: Launch.self)
public struct LaunchView: View {
    @Bindable public var store: StoreOf<Launch>

    public init(store: StoreOf<Launch>) {
        self.store = store
    }

    public var body: some View {
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
