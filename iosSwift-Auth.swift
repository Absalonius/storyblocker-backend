//: User Sign Up
let userAttributes = [AuthUserAttribute(.email, value: email)]
let options = AuthSignUpRequest.Options(userAttributes: userAttributes)
do {
    let signUpResult = try await Amplify.Auth.signUp(
        username: username,
        password: password,
        options: options
    )
    if case let .confirmUser(deliveryDetails, _, userId) = signUpResult.nextStep {
        print("Delivery details \(String(describing: deliveryDetails)) for userId: \(String(describing: userId)))")
    } else {
        print("SignUp Complete")
    }
} catch let error as AuthError {
    print("An error occurred while registering a user \(error)")
} catch {
    print("Unexpected error: \(error)")
}
//: User Sign In
let userAttributes = [AuthUserAttribute(.email, value: email)]
let options = AuthSignUpRequest.Options(userAttributes: userAttributes)
do {
    let signUpResult = try await Amplify.Auth.signUp(
        username: username,
        password: password,
        options: options
    )
    if case let .confirmUser(deliveryDetails, _, userId) = signUpResult.nextStep {
        print("Delivery details \(String(describing: deliveryDetails)) for userId: \(String(describing: userId)))")
    } else {
        print("SignUp Complete")
    }
} catch let error as AuthError {
    print("An error occurred while registering a user \(error)")
} catch {
    print("Unexpected error: \(error)")
}
//: User Sign Out
let result = await Amplify.Auth.signOut()
if let signOutResult = result as? AWSCognitoSignOutResult {
    print("Local signout successful: \(signOutResult.signedOutLocally)")
    switch signOutResult {
    case .complete:
        print("SignOut completed")
    case .failed(let error):
        print("SignOut failed with \(error)")
    case let .partial(revokeTokenError, globalSignOutError, hostedUIError):
        print(
        """
        SignOut is partial.
        RevokeTokenError: \(String(describing: revokeTokenError))
        GlobalSignOutError: \(String(describing: globalSignOutError))
        HostedUIError: \(String(describing: hostedUIError))
        """
        )
    }
}
