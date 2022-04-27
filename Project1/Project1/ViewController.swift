//
//  ViewController.swift
//  Project1
//
//  Created by Furkan Sarı on 26.04.2022.
//

import UIKit

class ViewController: UITableViewController {
    var pictures = [String]()
    var choosenImage : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Storm Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
       
        tableView.dataSource = self
        tableView.delegate = self
                let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for singleItem in items {
            if singleItem.hasPrefix("nssl"){
                pictures.append(singleItem)
            }
        }
        print(pictures)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var pict = pictures.sorted()
        let cell = UITableViewCell()
        cell.textLabel?.text = pict[indexPath.row]
        
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        choosenImage = pictures[indexPath.row]
        print(indexPath.row)
        performSegue(withIdentifier: "toDetailPage", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var destination = segue.destination as! DetailViewController
        destination.selectedImage = choosenImage
    }
    
}

