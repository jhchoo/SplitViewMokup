//
//  MainListViewController.swift
//  pushMokup
//
//  Created by jae hwan choo on 2020/10/22.
//
import UIKit

class MainListViewController: UIViewController {

    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var tableView: UITableView!

    @IBOutlet weak var textTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Singletone.data.mainListVC = self
        
        topView.layer.cornerRadius = 20
        topView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]

        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
    }

    @IBAction func actionMove(_ sender: Any) {
        AppNavigator.shared.setting()
    }
    
    
    
}

extension MainListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DealerTableViewCell", for: indexPath) as! DealerTableViewCell
        
        cell.configure(index: indexPath.row)
        
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        AppNavigator.shared.Detail(index: indexPath.row)
    }
}

