//
//  DayWeatherViewController.swift
//  MusalaSoftiOSTask
//
//  Created by kjoe on 11/22/21.
//

import UIKit

class DayWeatherViewController: UIViewController {
    
    var viewModel: DayWeatherViewRepresentable!
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var notInternet: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(self.networkChanged(_:)), name: NSNotification.Name.init(rawValue: "networkChanged"), object: nil)
        if CompositionalRoot.shared.monitor.isNetworkAvailable() == false {
            notInternet.isHidden = false
        }else {
            viewModel.loadData()
        }
        viewModel.dataUpdated = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        viewModel.errorHappen = { [weak self] error in
            DispatchQueue.main.async {
                self?.showAlert(message: error.localizedDescription)
            }
        }
        self.title = viewModel.title
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
                self.viewModel.loadData()
                self.notInternet.isHidden = true
            }else {
                self.notInternet.isHidden = false
            }
        }
    }
}

extension DayWeatherViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfDays
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DayWeatherTableViewCell.identifier) as! DayWeatherTableViewCell
        let vm = viewModel.viewModel(for: indexPath.row)
        cell.configure(with: vm)
        return cell
    }
}

extension DayWeatherViewController: UITableViewDelegate {
    
}

extension UIViewController {
    func showAlert(title: String = "Error", message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(action)
        self.showDetailViewController(alert, sender: self)
    }
}
