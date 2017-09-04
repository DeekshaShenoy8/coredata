//
//  TableViewController.swift
//  CoreDataEx
//
//  Created by Deeksha Shenoy on 01/09/17.
//  Copyright © 2017 Deeksha Shenoy. All rights reserved.
//

import UIKit

class TableViewController: UIViewController {

    var arrayOfCollege : [College]?
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        for item in arrayOfCollege!
//        {
//            print(item)
//        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

extension TableViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (arrayOfCollege?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        //cell.textLabel?.text = "hi"
        cell.textLabel?.text = String(arrayOfCollege! [indexPath.row].collegeName!)
        return cell
    }

}

