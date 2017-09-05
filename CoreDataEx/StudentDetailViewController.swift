//
//  StudentDetailViewController.swift
//  CoreDataEx
//
//  Created by Deeksha Shenoy on 05/09/17.
//  Copyright © 2017 Deeksha Shenoy. All rights reserved.
//

import UIKit
import CoreData

class StudentDetailViewController: UIViewController {
    var arrayOfStudent : [Student] = []
    var myCollege = " "
    @IBOutlet weak var studentIdText: UITextField!
    @IBOutlet weak var studentNameText: UITextField!
    @IBOutlet weak var collegenameText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
       

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func submitButton(_ sender: Any) {
        
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.newBackgroundContext()
        
        context.perform {
            let studentEntity: Student = NSEntityDescription.insertNewObject(forEntityName: "Student", into: context) as!  Student
            studentEntity.studentName = self.studentNameText.text
            //            if let studentId = self.studentIdText.text {
            //            studentEntity.studentId = Int32(studentId)
            //            } else {
            //                studentEntity.studentId = 0
            //            }
            
            studentEntity.studentId = Int32(self.studentIdText.text!) ?? 0
            self.myCollege = self.collegenameText.text!
            
            let predicate = NSPredicate(format: "collegeName CONTAINS[cd] %@", self.myCollege)
            let request = NSFetchRequest<College>(entityName : "College")
            request.predicate = predicate
            
            do {
                let collegeObject = try context.fetch(request)
                let mycollege = collegeObject.first
                print(mycollege?.id ?? 11)
                print(mycollege?.collegeName ?? " ")
                studentEntity.belongsto = mycollege
                //myCollege.addCon
            }
            catch {
                
            }
            
            do{
                try context.save()
            } catch {
                print(error)
            }
            
            
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
