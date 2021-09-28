// swiftlint:disable all
import Amplify
import Foundation

// Contains the set of classes that conforms to the `Model` protocol. 

final public class AmplifyModels: AmplifyModelRegistration {
  public let version: String = "cf0a80f7efae3bd35e33b43fc201c528"
  
  public func registerModels(registry: ModelRegistry.Type) {
    ModelRegistry.register(modelType: Organization.self)
  }
}