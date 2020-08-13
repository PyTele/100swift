//
//  ViewController.swift
//  Project 7
//
//  Created by Hubert Leszkiewicz on 30/07/2020.
//

import UIKit

class ViewController: UITableViewController {
    var petitions = [Petition]()


    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    func fetchJSON() {
        <#function body#>
    }
    
    func showError() {
        DispatchQueue.main.async { [weak self] in
        let ac = UIAlertController(title: "Loading Error", message: "There was a problem loading the feed; please check your network connection and try again.", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Ok", style: .destructive))
            self?.present(ac, animated: true)
        }
    }
    func parse(json: Data) {
        let decoder = JSONDecoder()

        if let jsonPetitions = try? decoder.decode(Petitions.self, from: json) {
            petitions = jsonPetitions.results
            
            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
            }
        }
    }
        
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return petitions.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let petition = petitions[indexPath.row]
        cell.textLabel?.text = petition.title
        cell.detailTextLabel?.text = petition.body
//        cell.textLabel?.text = "Title goes here"
//        cell.detailTextLabel?.text = "Subtitle goes here"
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController ()
        vc.detailItem = petitions [indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }

}

