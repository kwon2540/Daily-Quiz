import ComposableArchitecture

// MARK: - Reducer
@Reducer
public struct Login {
    @ObservableState
    public struct State: Equatable {
        public init() {}
    }

    public enum Action: ViewAction, BindableAction {
        public enum View {
            case onAppear
        }

        case binding(BindingAction<State>)
        case view(View)
    }

    public init() {}

    public var body: some ReducerOf<Self> {
        BindingReducer()

        Reduce { state, action in
            switch action {
            case .view(.onAppear):
                return onAppear(state: &state)

            case .binding,
                    .view:
                return .none
            }
        }
    }
}

private extension Login {
    func onAppear(state: inout State) -> Effect<Action> {
        .none
    }
}
