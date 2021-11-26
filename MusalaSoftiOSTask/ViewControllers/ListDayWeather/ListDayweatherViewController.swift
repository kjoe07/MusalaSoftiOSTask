//
//  ListDayweatherViewController.swift
//  MusalaSoftiOSTask
//
//  Created by kjoe on 11/23/21.
//

import UIKit
import ActivityIndicator
class ListDayWeatherViewController: UIViewController {
    var viewModel: ListDayWeatherViewRepresentable!

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var notInternet: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = viewModel.title
        tableView.dataSource = self
        tableView.delegate = self
        
        viewModel.dataUpdate = {[weak self] in
            DispatchQueue.main.async {
                guard let self = self else {return}
                self.hideActivityIndicator()
                self.tableView.reloadData()
            }
        }
        viewModel.downloadFailed = { [weak self] error in
            DispatchQueue.main.async {
                self?.showAlert(message: error.localizedDescription)
            }
        }
        self.showActivityIndicator(color: .label)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.networkChanged(_:)), name: NSNotification.Name.init(rawValue: "networkChanged"), object: nil)
        if CompositionalRoot.shared.monitor.isNetworkAvailable() == false {
            notInternet.isHidden = false
        }
        viewModel.loadData()
    }
    static var ListDayWeatherSegue: String {
        return String(describing: ListDayWeatherViewController.self)
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }
   
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == DayWeatherViewController.DayWeatherSegue {
            guard let sender = sender as? Int else {
                return
            }

            let vc = segue.destination as! DayWeatherViewController
            guard let vm = viewModel.dayWeatherViewViewModel(index: sender) else {
                return
            }
            vc.viewModel = vm
        }
    }
    
    @objc func networkChanged(_ notification: Notification) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {return}
            let status = notification.object as! Bool
            if status {
                self.viewModel.loadData()
                self.notInternet.isHidden = true
            }else {
                self.self.notInternet.isHidden = false
            }
        }        
    }

}
extension ListDayWeatherViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfDays
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ListDayTableViewCell.identifier) as! ListDayTableViewCell
        cell.configure(with: viewModel.viewModel(for: indexPath.row))
        return cell //?? UITableViewCell()
    }
}

extension ListDayWeatherViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: DayWeatherViewController.DayWeatherSegue, sender: indexPath.row)
    }
}
