import ComposableArchitecture
import LaunchFeature
import SwiftUI

public protocol App: SwiftUI.App {}

extension App {
    public var body: some Scene {
        WindowGroup {
            LaunchView(
                store: .init(
                    initialState: .init(),
                    reducer: Launch.init
                )
            )
        }
    }
}
