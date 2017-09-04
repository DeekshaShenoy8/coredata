//
//  College+CoreDataProperties.swift
//  CoreDataEx
//
//  Created by Deeksha Shenoy on 01/09/17.
//  Copyright © 2017 Deeksha Shenoy. All rights reserved.
//

import Foundation
import CoreData


extension College {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<College> {
        return NSFetchRequest<College>(entityName: "College")
    }

    @NSManaged public var id: Int32
    @NSManaged public var collegeName: String?

}
