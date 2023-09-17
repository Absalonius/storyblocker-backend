//: For iCloud Specific review documentation here : https://docs.amplify.aws/lib/storage/upload/q/platform/ios/#upload-file
/*:
S3 Data Tiers:
- Public - Accessible to All
- Protected - Accessible to All but only writable by user
- Private - Only accessible by user

*/
//: User Data Upload
import Amplify

do {
    let dataString = "MyData"
    let data = Data(dataString.utf8)
    let uploadTask = try await Amplify.Storage.uploadData(
        key: "ExampleKey",
        data: data
    )
    
    Task {
        for await progress in await uploadTask.progress {
            print("Progress: \(progress)")
        }
    }
    
    let value = try await uploadTask.value
    print("Completed: \(value)")
} catch let error as StorageError {
    print("Failed: \(error.errorDescription). \(error.recoverySuggestion)")
} catch {
    print("Unexpected error: \(error)")
}
//: If Data is meant to be Private
import Amplify

do {
    let dataString = "MyData"
    let data = Data(dataString.utf8)
    let options = StorageUploadDataRequest.Options(accessLevel: .private)
    let uploadTask = try await Amplify.Storage.uploadData(
        key: "ExampleKey",
        data: data,
        options: options
    )

    Task {
        for await progress in await uploadTask.progress {
            print("Progress: \(progress)")
        }
    }

    let value = try await uploadTask.value
    print("Completed: \(value)")
} catch let error as StorageError {
    print("Failed: \(error.errorDescription). \(error.recoverySuggestion)")
} catch {
    print("Unexpected error: \(error)")
}
//: S3 Download
import Amplify

do {
    let options = StorageDownloadDataRequest.Options(accessLevel: .private)
    let downloadTask = try await Amplify.Storage.downloadData(
        key: "ExampleKey",
        options: options
    )

    Task {
        for await progress in await downloadTask.progress {
            print("Progress: \(progress)")
        }
    }

    let value = try await downloadTask.value
    print("Completed: \(value)")
} catch let error as StorageError {
    print("Failed: \(error.errorDescription). \(error.recoverySuggestion)")
} catch {
    print("Unexpected error: \(error)")
}
//: S3 List Files
import Amplify

do {
    let options = StorageListRequest.Options(accessLevel: .private)
    let listResult = try await Amplify.Storage.list(options: options)
    print("Completed")
    listResult.items.forEach { item in
        print("Key: \(item.key)")
    }
} catch let error as StorageError {
    print("Failed: \(error.errorDescription). \(error.recoverySuggestion)")
} catch {
    print("Unexpected error: \(error)")
}
//: S3 Remove Files
import Amplify

do {
    let options = StorageRemoveRequest.Options(accessLevel: .private)
    let removedKey = try await Amplify.Storage.remove(key: "ExampleKey")
    print("Deleted \(removedKey)")
} catch let error as StorageError {
    print("Failed: \(error.errorDescription). \(error.recoverySuggestion)")
} catch {
    print("Unexpected error: \(error)")
}
