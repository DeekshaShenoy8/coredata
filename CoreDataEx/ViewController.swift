//
//  ViewController.swift
//  CoreDataEx
//
//  Created by Deeksha Shenoy on 01/09/17.
//  Copyright © 2017 Deeksha Shenoy. All rights reserved.
//

import UIKit
import CoreData

var arrayOfColleges : [College] = []
class ViewController: UIViewController {

    @IBOutlet weak var collegeId: UITextField!
    @IBOutlet weak var name: UITextField!
 
    override func viewDidLoad() {
        super.viewDidLoad()
      //  createStudent()
       // fetchStudent()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createStudent() {
        
       
    }
    
    @IBAction func viewDeatailAction(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
                let request = NSFetchRequest<College>(entityName: "College")
        //        let predicate = NSPredicate(format: "collegeName", " akash")
        //
        //        request.predicate = predicate
                do {
                    let studentObject = try context.fetch(request)
                    arrayOfColleges = studentObject
                    print(arrayOfColleges)
        
                    for item in studentObject
                    {
                        print(item.collegeName ?? " ")
                        print(item.id )
                    }
                }
                catch {
                    print(error)
                }
        
        let tableVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "tableview") as! TableViewController
        tableVC.arrayOfCollege = arrayOfColleges
        present(tableVC, animated: true, completion: nil)
        self.navigationController?.pushViewController(tableVC, animated: true)
        
                

    }

//    func fetchStudent() {
//        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
//        let request = NSFetchRequest<College>(entityName: "College")
////        let predicate = NSPredicate(format: "collegeName", " akash")
////        
////        request.predicate = predicate
//        do {
//            let studentObject = try context.fetch(request)
//            print(studentObject)
//            
//            for item in studentObject
//            {
//                print(item.collegeName ?? " ")
//                print(item.id )
//            }
//        }
//        catch {
//            print(error)
//        }
//        
//        
//    }
    @IBAction func submitAction(_ sender: Any) {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.newBackgroundContext()
        
        context.perform {
            let studentEntity: College = NSEntityDescription.insertNewObject(forEntityName: "College", into: context) as!  College
            studentEntity.collegeName = self.name.text
            studentEntity.id = Int32(self.collegeId.text!)!
            do{
                try context.save()
            } catch {
                print(error)
            }
            
            
        }

    }
    


}

