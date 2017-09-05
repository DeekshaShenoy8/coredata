//
//  College+CoreDataProperties.swift
//  CoreDataEx
//
//  Created by Deeksha Shenoy on 05/09/17.
//  Copyright © 2017 Deeksha Shenoy. All rights reserved.
//

import Foundation
import CoreData


extension College {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<College> {
        return NSFetchRequest<College>(entityName: "College")
    }

    @NSManaged public var collegeName: String?
    @NSManaged public var id: Int32
    @NSManaged public var contains: Student?

}
