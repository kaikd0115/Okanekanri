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
    
    var barArray : [String] = []
    var memoryArray : [String] = []
    
    
    

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
            
        barArray = []
        
            }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section : Int) -> Int {
        return barArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath : IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        //cell?.textLabel?.text = "テスト"
        return cell!
    }
    func readFromUserDefaults(){
        guard let memoryArray = UserDefaults.standard.array(forKey: "1") as? [String] else {
            return
        }
      barArray = memoryArray
    }
    
    }





