//
//  ViewController.swift
//  PopularPassingData
//
//  Created by Dino Minh Dao on 2020/03/21.
//  Copyright © 2020 DinoByCloud. All rights reserved.
//

import UIKit

extension Notification.Name {
    static let dark = NSNotification.Name(rawValue: "ActionOnMyCellDark")
    static let light = NSNotification.Name(rawValue: "ActionOnMyCellLight")
}

class ViewController: UIViewController {

    @IBOutlet weak var viewInfo: UIView!
    @IBOutlet weak var lbInfo: UILabel!

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 60
        tableView.register(UINib(nibName: "\(MyTableViewCell.self)", bundle: nil), forCellReuseIdentifier: "\(MyTableViewCell.self)")
    }

    func showDark(indexPath: IndexPath?) {
        viewInfo.backgroundColor = .black
        lbInfo.text = "\(String(describing: indexPath))"
        lbInfo.textColor = .white
    }

    func showLight(indexPath: IndexPath?) {
        viewInfo.backgroundColor = .white
        lbInfo.text = "\(String(describing: indexPath))"
        lbInfo.textColor = .black
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(MyTableViewCell.self)", for: indexPath) as! MyTableViewCell
        cell.indexPath = indexPath
        cell.delegate = self
        return cell
    }
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return false
    }
}

extension ViewController: ActionOnCell {
    func didTapDark(indexPath: IndexPath?) {
        self.showDark(indexPath: indexPath)
    }
    
    func didTapLight(indexPath: IndexPath?) {
        self.showLight(indexPath: indexPath)
    }
}



