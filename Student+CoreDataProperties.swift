//
//  Student+CoreDataProperties.swift
//  CoreDataEx
//
//  Created by Deeksha Shenoy on 05/09/17.
//  Copyright © 2017 Deeksha Shenoy. All rights reserved.
//

import Foundation
import CoreData


extension Student {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Student> {
        return NSFetchRequest<Student>(entityName: "Student")
    }

    @NSManaged public var studentName: String?
    @NSManaged public var studentId: Int32
    @NSManaged public var belongsto: College?

}
