import ComposableArchitecture

// MARK: - Reducer
@Reducer
public struct Launch {
    @Reducer
    public enum Destination {
        case destination
        // Add Destination
    }

    @ObservableState
    public struct State: Equatable {
        @Presents var destination: Destination.State?
        // Add State
    }

    public enum Action: ViewAction, BindableAction {
        public enum View {
            case onAppear
            // Add ViewAction
        }

        public enum Delegate {
            // Add DelegateAction
        }

        public enum Parent {
            // Add ParentAction
        }

        case binding(BindingAction<State>)
        case view(View)
        case delegate(Delegate)
        case parent(Parent)
        case destination(PresentationAction<Destination.Action>)
    }

    public init() {}

    public var body: some ReducerOf<Self> {
        BindingReducer()

        Reduce { state, action in
            switch action {
            case .view(.onAppear):
                return onAppear(state: &state)

            case .binding,
                 .view,
                 .delegate,
                 .parent,
                 .destination:
                return .none
            }
        }
        .ifLet(\.$destination, action: \.destination)
    }
}

private extension Launch {
    func onAppear(state: inout State) -> Effect<Action> {
        // Add onAppear logic
        .none
    }
}
