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
do {
    let result = try await Amplify.Auth.signIn(
        username: username,
        password: password
    )
    print("Sign in successful: \(result.isSignedIn)")
} catch let error as AuthError {
    print("Sign in failed with error: \(error)")
} catch {
    print("Unexpected error: \(error)")
}
