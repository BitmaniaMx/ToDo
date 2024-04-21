//
//  TaskManager.swift
//  ToDo
//
//  Created by Rafael González on 20/04/24.
//

import Foundation
import CoreData

class TasksManager{
    private var TDTasks : [TDTask] = []
    private var context : NSManagedObjectContext
    
    init(context : NSManagedObjectContext) {
        self.context = context
    }
    
    func fetch() {
        do {
            self.TDTasks = try self.context.fetch(TDTask.fetchRequest())
        }
        catch let error {
            print("error: ", error)
        }
    }
        
    //Fetch using a predicate
    func fetchWithPredicate(searchValue : String) {
        do {
            let fetchRequestWP = NSFetchRequest<TDTask>(entityName: "TDTask")
            fetchRequestWP.predicate = NSPredicate(format: "title = %@", searchValue)
            print(fetchRequestWP)
            self.TDTasks = try self.context.fetch(fetchRequestWP)
        }
        catch let error{
            print("error: ", error)
        }
    }
    
    //Fetch using a compound predicate
    func fetchWithCompoundPredicate(title : String = "", notes : String = "" ) {
        var predicates : [NSPredicate] = []
        
        if !(title.isEmpty){
            predicates.append(NSPredicate(format: "title LIKE %@", title))
        }
        
        if !(notes.isEmpty){
            predicates.append(NSPredicate(format: "notes LIKE %@", notes))
        }
        
        var compoundPredicate = NSCompoundPredicate(orPredicateWithSubpredicates: predicates)
        
        
        do {
            let fetchRequestWP = NSFetchRequest<TDTask>(entityName: "TDTask")
            fetchRequestWP.predicate = compoundPredicate
            print(fetchRequestWP)
            self.TDTasks = try self.context.fetch(fetchRequestWP)
        }
        catch let error{
            print("error: ", error)
        }
    }
}
