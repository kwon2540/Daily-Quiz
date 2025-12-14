import ComposableArchitecture
import LaunchFeature
import LoginFeature

// MARK: - Reducer
@Reducer
public struct Root {
    @Reducer
    public enum Destination {
        case launch(Launch)
        case login(Login)
    }

    @ObservableState
    public struct State: Equatable {
        public init() {}

        @Presents var destination: Destination.State?
    }

    public enum Action: ViewAction {
        public enum View {
            case onAppear
        }

        public enum Delegate {
            // Add DelegateAction
        }

        case view(View)
        case delegate(Delegate)
        case destination(PresentationAction<Destination.Action>)
    }

    public init() {}

    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .view(.onAppear):
                return onAppear(state: &state)

            case .view,
                 .delegate,
                 .destination:
                break
            }
            return .none
        }
        .ifLet(\.$destination, action: \.destination)
    }
}

extension Root.Destination.State: Equatable {}

private extension Root {
    func onAppear(state: inout State) -> Effect<Action> {
        state.destination = .launch(Launch.State())
        return .none
    }
}
