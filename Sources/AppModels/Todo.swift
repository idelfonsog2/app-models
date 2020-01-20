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
extension Todo: Migration {
    public static func prepare(on connection: PostgreSQLConnection) -> Future<Void> {
        return Database.create(self, on: connection) { (builder) in
            try addProperties(to: builder)
            builder.reference(from: \.userID, to: \User.id) // this setup the FK between the two tables
        }
    }
}

extension Todo: Content { } /// Allows `Todo` to be encoded to and decoded from HTTP messages.
extension Todo: Parameter { }
extension Todo: PostgreSQLModel { }

//extension User: Model {
//    public typealias Database = PostgreSQLDatabase
//
//    public typealias ID = UUID
//
//    public static var idKey: IDKey = \User.id
//}

public extension Todo {
    var user: Parent <Todo, User> {
        return parent(\.userID)
    }
}

public extension Todo {
    var categorias: Siblings<Todo, Categoria, TodoCategoryPivot> {
        return siblings()
    }
}
