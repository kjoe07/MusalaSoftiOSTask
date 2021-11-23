//
//  ListCitiesViewController.swift
//  MusalaSoftiOSTask
//
//  Created by kjoe on 11/22/21.
//

import UIKit

class ListCitiesViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    var viewModel: ListCitiesViewRepresentable!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == ListDayweatherViewController.ListDayWeatherSegue {
            let vc = segue.destination as! ListDayweatherViewController
            //TODO: Pass viewModel to nextViewController or location woeid
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
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        (cell as! CitiesTableViewCell).titleLable.text = ""
    }
}

extension ListCitiesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: ListDayweatherViewController.ListDayWeatherSegue, sender: indexPath.row)
    }
}
