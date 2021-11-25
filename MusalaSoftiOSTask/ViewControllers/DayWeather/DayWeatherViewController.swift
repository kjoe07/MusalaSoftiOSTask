//
//  DayWeatherViewController.swift
//  MusalaSoftiOSTask
//
//  Created by kjoe on 11/22/21.
//

import UIKit

class DayWeatherViewController: UIViewController {
    
    var viewModel: DayWeatherViewViewModel!
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var notInternet: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(self.networkChanged(_:)), name: NSNotification.Name.init(rawValue: "networkChanged"), object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    static var DayWeatherSegue: String {
        return String(describing: DayWeatherViewController.self)
    }

    @objc func networkChanged(_ notification: Notification) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {return}
            let status = notification.object as! Bool
            if status {
                //viewModel.loadData()
                self.notInternet.isHidden = true
            }else {
                self.notInternet.isHidden = false
            }
        }
    }
}

extension DayWeatherViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        return cell ?? UITableViewCell()
    }
}

extension DayWeatherViewController: UITableViewDelegate {
    
}
