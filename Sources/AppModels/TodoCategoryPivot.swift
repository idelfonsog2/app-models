//
//  File.swift
//  
//
//  Created by Idelfonso Gutierrez on 1/9/20.
//

import FluentPostgreSQL
import Foundation

public final class TodoCategoryPivot: PostgreSQLUUIDPivot {
    public var id: UUID?
    
    public var todoID: Todo.ID
    public var categoryID: Categoria.ID
    
    public typealias Left = Todo
    public typealias Right = Categoria
    
    public static let leftIDKey: LeftIDKey = \.todoID
    public static let rightIDKey: RightIDKey = \.categoryID
    
    public init(_ todo: Todo, _ category: Categoria) throws {
        self.todoID = try todo.requireID()
        self.categoryID = try category.requireID()
    }
}

extension TodoCategoryPivot: ModifiablePivot { }

extension TodoCategoryPivot: Migration {
    static public func prepare(on connection: PostgreSQLConnection) -> Future<Void> {
        return Database.create(self, on: connection) { (builder) in
            try addProperties(to: builder)
            
            builder.reference(from: \.todoID, to: \Todo.id, onDelete: .cascade)
            builder.reference(from: \.categoryID, to: \Categoria.id, onDelete: .cascade)
        }
    }
}
