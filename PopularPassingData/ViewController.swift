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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        NotificationCenter.default.addObserver(self, selector: #selector(didTapDark(noti:)), name: .didTapDark, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(didTapLight(noti:)), name: .didTapLight, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
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
        return cell
    }
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return false
    }
}
extension Notification.Name {
    static let didTapDark = NSNotification.Name(rawValue: "didTapDarkNotification")
    static let didTapLight = NSNotification.Name(rawValue: "didTapLightNotification")
}

extension ViewController {
    @objc private func didTapDark(noti: Notification){
        showDark(indexPath: noti.object as? IndexPath)
    }
    @objc private func didTapLight(noti: Notification){
        showLight(indexPath: noti.object as? IndexPath)
    }
}

