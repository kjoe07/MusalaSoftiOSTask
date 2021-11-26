//
//  ListCitiesViewController.swift
//  MusalaSoftiOSTask
//
//  Created by kjoe on 11/22/21.
//

import UIKit

class ListCitiesViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var notInternet: UIView!
    
    var viewModel: ListCitiesViewRepresentable!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        viewModel.dataUpdated = {[weak self] in
            DispatchQueue.main.async {
                guard let self = self else {return}
                self.tableView.reloadData()
            }
        }
        NotificationCenter.default.addObserver(self, selector: #selector(self.networkChanged(_:)), name: NSNotification.Name.init(rawValue: "networkChanged"), object: nil)
    }    

    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == ListDayWeatherViewController.ListDayWeatherSegue {
            let vc = segue.destination as! ListDayWeatherViewController
            let vm = viewModel.listDayViewModel(for: sender as! Int)
            vc.viewModel = vm            
        }
    }

    @objc func networkChanged(_ notification: Notification) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            let status = notification.object as! Bool
            if status {
                self.notInternet.isHidden = true
            }else {
                self.notInternet.isHidden = false
            }
        }
        
    }

}

extension ListCitiesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfCities
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CitiesTableViewCell.identifier) as! CitiesTableViewCell
        let vm = viewModel.viewModel(for: indexPath.row)
        cell.configure(viewModel: vm)
        return cell
    }
}

extension ListCitiesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: ListDayWeatherViewController.ListDayWeatherSegue, sender: indexPath.row)
    }
}
