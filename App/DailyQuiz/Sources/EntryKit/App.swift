import ComposableArchitecture
import RootFeature
import SwiftUI

public protocol App: SwiftUI.App {}

extension App {
    public var body: some Scene {
        WindowGroup {
            RootView(
                store: .init(
                    initialState: .init(),
                    reducer: Root.init
                )
            )
        }
    }
}
