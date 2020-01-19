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

extension TodoCategoryPivot: Migration { }
extension TodoCategoryPivot: ModifiablePivot { }
