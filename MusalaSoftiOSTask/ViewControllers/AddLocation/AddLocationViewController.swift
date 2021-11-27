//
//  AddLocationViewController.swift
//  MusalaSoftiOSTask
//
//  Created by kjoe on 11/26/21.
//

import UIKit

class AddLocationViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var notInternet: UIView!
    
    var location: [ResponseWoeid]?
    var manager: CoreDataManager?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        searchButton.isHidden = true
        NotificationCenter.default.addObserver(self, selector: #selector(self.networkChanged(_:)), name: NSNotification.Name.init(rawValue: "networkChanged"), object: nil)
        if CompositionalRoot.shared.monitor.isNetworkAvailable() == false {
            notInternet.isHidden = false
        }
    }
    
    static var segueIdentifier: String {
        String(describing: AddLocationViewController.self)
    }
    

    func loadData(term: String) {
        let qItems = URLQueryItem(name: "query", value: term)
        let endpoint = LocationEndpoint(path: "/api/location/search/", queryItems: [qItems], method: .get)
        let service = RemoteDataService(loader: NetworkLoader(), endpoint: endpoint)
        self.showActivityIndicator(color: UIColor.green)
        service.getData(completion: { [weak self] (result: Result<[ResponseWoeid],Error>) in
            DispatchQueue.main.async {
                guard let self = self else {return}
                self.hideActivityIndicator()
                switch result {
                case .success(let success):
                    self.location = success
                    self.tableView.reloadData()
                case .failure(let e):
                    self.showAlert(message: e.localizedDescription)
                }
            }
        })
    }


    func resetSearch() {
        location = nil
        searchBar.text = ""
        tableView.reloadData()
    }
    
    @objc func networkChanged(_ notification: Notification) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {return}
            let status = notification.object as! Bool
            if status {
                self.notInternet.isHidden = true
            }else {
                self.self.notInternet.isHidden = false
            }
        }
    }
}

extension AddLocationViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return location?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = location?[indexPath.row].title ?? ""
        return cell ?? UITableViewCell()
    }
    
    
}

extension AddLocationViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let location = location?[indexPath.row] else {return}
        ConsolidateWeatherBuilder.createLocationFromResponseWoeidModel(model: location , manager: manager!)
        self.navigationController?.popViewController(animated: true)
    }
}

extension AddLocationViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if searchBar.text?.isEmpty == false {
            loadData(term: searchBar.text ?? "")
        }else{
            resetSearch()
        }
        
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        resetSearch()
    }
}

extension AddLocationViewController{
    @IBAction func doSearch(_ sender: UIButton){
        if searchBar.text?.isEmpty == false {
            loadData(term: searchBar.text ?? "")
        }else {
            self.showAlert(message: "search term could not be empty")
        }
    }
}
