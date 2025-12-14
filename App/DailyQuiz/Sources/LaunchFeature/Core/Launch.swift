import ComposableArchitecture
import LoginFeature

// MARK: - Reducer
@Reducer
public struct Launch {
    @ObservableState
    public struct State: Equatable {
        public init() {}
    }

    public enum Action: ViewAction, BindableAction {
        public enum View {
            case onAppear
        }

        public enum Delegate {
            case launchFinished(isLogin: Bool)
        }

        case binding(BindingAction<State>)
        case view(View)
        case delegate(Delegate)
    }

    public init() {}

    public var body: some ReducerOf<Self> {
        BindingReducer()

        Reduce { state, action in
            switch action {
            case .view(.onAppear):
                return onAppear(state: &state)

            case .binding,
                    .delegate:
                return .none
            }
        }
    }
}

private extension Launch {
    func onAppear(state: inout State) -> Effect<Action> {
        .send(.delegate(.launchFinished(isLogin: false)))
    }
}
