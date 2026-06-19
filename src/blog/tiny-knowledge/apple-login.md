# apple login

## absolute minimal

### what it does

- login with apple
- print identifier

### to login to api server (THERE IS A PROBLEM!)

- send identifier to api server <- NOT SAFE
- server generates jwt
- client request with jwt on header afterwards

### code

```swift
import AuthenticationServices
import SwiftUI

struct LoginView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.cWhite)
            SignInWithAppleButton { _ in
                // request in
                // request.nonce = LoginManager.instance.nonce
            } onCompletion: { result in
                switch result {
                case let .success(authorization):
                    handleAuthorization(authorization)
                case let .failure(error):
                    print("---- apple login failed:", error)
                }
            }
            .frame(height: 64) // Apple's max
            .frame(maxWidth: 375) // Apple's max
        }
        .ignoresSafeArea()
    }
}

/// Handle the successful credential extraction
private func handleAuthorization(_ authorization: ASAuthorization) {
    guard let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential else {
        print("---- MUST HANDLE THIS:", "failed to handle authorization after apple login success")
        return
    }

    let userIdentifier = appleIDCredential.user
    print("user identifier:", userIdentifier)
}

```

## how to wrap identifier with jwt then send it

-
