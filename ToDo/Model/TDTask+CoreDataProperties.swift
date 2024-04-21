//
//  TDTask+CoreDataProperties.swift
//  ToDo
//
//  Created by Rafael González on 20/04/24.
//
//

import Foundation
import CoreData


extension TDTask {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TDTask> {
        return NSFetchRequest<TDTask>(entityName: "TDTask")
    }

    @NSManaged public var title: String?
    @NSManaged public var notes: String?
    @NSManaged public var date: Date?

}

extension TDTask : Identifiable {

}
