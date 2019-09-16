//
//  ViewController.swift
//  MyProject DZ14
//
//  Created by Sergey Gorshenin on 14/09/2019.
//  Copyright © 2019 Sergey Gorshenin. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController, UITableViewDataSource {
    
    
    var items: Results<datatemp>!
    
    @IBOutlet weak var tableView: UITableView!
    
    var temperatures: JsonData?

    override func viewDidLoad() {
        super.viewDidLoad()
        let realm = try! Realm()
        self.items = realm.objects(datatemp.self)
        
        LoaderTemp.loadtemp { (data) in
            if let data = data {
                DispatchQueue.main.async {
                self.temperatures = data
                self.tableView.reloadData()
                }
            } else {
                
            }
    }
        // Do any additional setup after loading the view.
    }
 
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return temperatures?.daily.data.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        let item = datatemp()
        item.name = "\(temperatures?.hourly.data)"
        let realm = try! Realm()
        try! realm.write {
            realm.add(item)
        }
        cell.TLabel.text = "\(temperatures?.daily.data[indexPath.row].temperatureHigh ?? 00)"
        return cell
    }
    

}

