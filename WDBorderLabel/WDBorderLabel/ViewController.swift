//
//  ViewController.swift
//  WDBorderLabel
//
//  Created by Dong Lei on 2024/10/24.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource{

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .secondarySystemBackground
        
        let table = UITableView(frame: self.view.bounds)
        table.rowHeight = 50
        table.dataSource = self
        table.register(.init(nibName: "WDBorderLabelTableViewCell", bundle: .main), forCellReuseIdentifier: "cellid")
        self.view.addSubview(table)
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellid", for: indexPath) as! WDBorderLabelTableViewCell
        cell.contentView.backgroundColor = .randomColor.withAlphaComponent(0.2)
        return cell
    }

}

extension UIColor {
    
    static var randomColor : UIColor {
        get {
            UIColor.init(red: CGFloat.random(in: 1...255) / 255, green: CGFloat.random(in: 1...255) / 255, blue: CGFloat.random(in: 1...255) / 255, alpha: 1)
        }
        
    }
    
}
