import Amplify
import AWSPluginsCore
...
//: Be sure to have pulled the AmplifyCLI configuration
//: Use to Create Data
func createUserAuth() async {
    var model = UserAuth(
		userid: "Lorem ipsum dolor sit amet",
		role: "Lorem ipsum dolor sit amet",
		credits: 1020,
		email: "test12346789@testemailtestemail.com",
		S3Address:  /* Provide init commands */)
    do {
        let result = try await Amplify.API.mutate(request: .create(model))
        switch result {
        case .success(let model):
            print("Successfully created UserAuth: \(model)")
        case .failure(let graphQLError):
            print("Failed to create graphql \(graphQLError)")
        }
    } catch let error as APIError {
        print("Failed to create UserAuth - \(error)")
    } catch {
        print("Unexpected error: \(error)")
    }
}
//: Update Example
func updateUserAuth(updatedModel: UserAuth) async {
    do {
        let result = try await Amplify.API.mutate(request: .update(updatedModel))
        switch result {
        case .success(let model):
            print("Successfully updated UserAuth: \(model)")
        case .failure(let error):
            print("Got failed result with \(error.errorDescription)")
        }
    } catch let error as APIError {
        print("Failed to update UserAuth - \(error)")
    } catch {
        print("Unexpected error: \(error)")
    }
}
//: Delete Example
func deleteUserAuth(toBeDeleted: UserAuth) async {
    do {
        let result = try await Amplify.API.mutate(request: .delete(toBeDeleted))
        switch result {
        case .success(let model):
            print("Successfully deleted UserAuth: \(model)")
        case .failure(let error):
            print("Got failed result with \(error.errorDescription)")
        }
    } catch let error as APIError {
        print("Failed to delete UserAuth - \(error)")
    } catch {
        print("Unexpected error: \(error)")
    }
}
//: Query Example
func getUserAuth() async {
    do {
        let result = try await Amplify.API.query(
            request: .get(UserAuth.self,
            byId: "ENTER MODEL ID HERE")
        )
        switch result {
        case .success(let model):
            guard let model = model else {
                print("Could not find model")
                return
            }
            print("Successfully retrieved model: \(model)")
        case .failure(let error):
            print("Got failed result with \(error)")
        }
    } catch let error as APIError {
        print("Failed to query UserAuth - \(error)")
    } catch {
        print("Unexpected error: \(error)")
    }
}
