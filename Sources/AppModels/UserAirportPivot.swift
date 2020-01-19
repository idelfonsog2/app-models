//
//  File.swift
//  
//
//  Created by Idelfonso Gutierrez on 1/9/20.
//

import FluentPostgreSQL
import Foundation

final class TodoCategoryPivot: PostgreSQLUUIDPivot {    
    var id: UUID?
    
    var todoID: Todo.ID
    var categoryID: Categoria.ID
    
    typealias Left = Todo
    typealias Right = Categoria
    
    static let leftIDKey: LeftIDKey = \.todoID
    static let rightIDKey: RightIDKey = \.categoryID
    
    init(_ todo: Todo, _ category: Categoria) throws {
        self.todoID = try todo.requireID()
        self.categoryID = try category.requireID()
    }
}

extension TodoCategoryPivot: Migration { }
extension TodoCategoryPivot: ModifiablePivot { }
