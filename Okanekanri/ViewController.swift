//
//  ViewController.swift
//  Okanekanri
//
//  Created by 児玉美穂 on R 5/05/17.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var table : UITableView!
    @IBOutlet var datelabel: UILabel!
    var time = ""
    
    var dates : [String] = []
    var amounts : [String] = []
    var purpsoses : [String] = []
    var savedArray : [String] = []
    
    var saveData : UserDefaults = UserDefaults.standard
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        table.dataSource = self
        
        let df = DateFormatter()
        df.locale = Locale(identifier: "ja_JP")
        df.dateStyle = .short
        
        print(df.string(from: Date()))
        time = df.string(from: Date())
        datelabel.text = time
        
        table.delegate = self
        
        saveData.register(defaults: ["dates":[]])
        dates = saveData.object(forKey: "date") as! [String]
            
        //dates = []
        
        readFromUserDefaults()
        sort()
        print(dates)
        
            }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section : Int) -> Int {
        return self.dates.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath : IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell( withIdentifier: "Cell")
        cell?.textLabel?.text = self.dates[indexPath.row]
        //cell?.textLabel?.text = "テスト"
        return cell!
    }
    func readFromUserDefaults(){
        guard UserDefaults.standard.array(forKey: "1") is [String] else {
            return
        }
        self.savedArray = dates
    }
    func sort(){
        dates = dates.reversed()
    }
    
    }





