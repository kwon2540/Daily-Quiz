import ComposableArchitecture
import LaunchFeature
import LoginFeature
import AppTabFeature

// MARK: - Reducer
@Reducer
public struct Root {
    @Reducer
    public enum Destination {
        case launch(Launch)
        case login(Login)
        case appTab(AppTab)
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

        case view(View)
        case destination(PresentationAction<Destination.Action>)
    }

    public init() {}

    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .view(.onAppear):
                state.destination = .launch(Launch.State())

            case .destination(.presented(.launch(.delegate(.launchFinished(let isLogin))))):
                if isLogin {
                    state.destination = .appTab(AppTab.State())
                } else {
                    state.destination = .login(Login.State())
                }

            case .view,
                 .destination:
                break
            }
            return .none
        }
        .ifLet(\.$destination, action: \.destination)
    }
}

extension Root.Destination.State: Equatable {}
