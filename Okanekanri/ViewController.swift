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
    var purposes : [String] = []
    
    var signs : [String] = []
    
    var saveData : UserDefaults = UserDefaults.standard
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        table.dataSource = self
        table.delegate = self
        
        let df = DateFormatter()
        df.locale = Locale(identifier: "ja_JP")
        df.dateStyle = .short
        
        print(df.string(from: Date()))
        time = df.string(from: Date())
        datelabel.text = time
        
        table.delegate = self
        
        dates = (saveData.array(forKey: "dates") ?? []) as! [String]
        amounts = (saveData.array(forKey: "amounts") ?? []) as! [String]
        purposes = (saveData.array(forKey: "purposes") ?? []) as! [String]
        signs = (saveData.array(forKey: "signs") ?? []) as! [String]
        
        
        
        dates = saveData.object(forKey: "date") as! [String]
        
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section : Int) -> Int {
        return dates.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath : IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell( withIdentifier: "Cell")
        cell?.textLabel?.text = self.dates[indexPath.row]
        //cell?.textLabel?.text = "テスト"
        return cell!
    }
    func refreshTableView(){
        dates = (saveData.array(forKey: "dates") ?? []) as! [String]
        amounts = (saveData.array(forKey: "amounts") ?? []) as! [String]
        purposes = (saveData.array(forKey: "purposes") ?? []) as! [String]
        signs = (saveData.array(forKey: "signs") ?? []) as! [String]
        table.reloadData()
    }
    
    
}





