import FluentPostgreSQL
import Vapor

/// A single entry of a Todo list.
public final class Todo: Codable {
    /// The unique identifier for this `Todo`.
    public var id: Int?
    public var userID: User.ID
    /// A title describing what this `Todo` entails.
    public var title: String

    /// Creates a new `Todo`.
    public init(id: Int? = nil, title: String, userID: User.ID) {
        self.id = id
        self.title = title
        self.userID = userID
    }
}

/// Allows `Todo` to be used as a dynamic migration.
extension Todo: Migration { }

/// Allows `Todo` to be encoded to and decoded from HTTP messages.
extension Todo: Content { }

/// Allows `Todo` to be used as a dynamic parameter in route definitions.
extension Todo: Parameter { }

extension Todo: PostgreSQLModel { }

extension Todo {
    var user: Parent <Todo, User> {
        return parent(\.userID)
    }
}
