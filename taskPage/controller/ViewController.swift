//
//  ViewController.swift
//  taskPage
//
//  Created by Sujith on 07/09/22.
//

import UIKit
import Alamofire
import Kingfisher


class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    var info :[Message] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return info.count
    }

    @IBOutlet weak var tableView: UITableView!
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reusableCell", for: indexPath) as! MessageCell
        let info = info[indexPath.row]
        cell.titleLabel.text = info.title
        cell.categoryLabel.text = info.category
        cell.priceLabel.text = String(info.price)
        cell.RatingLabel.text = String(info.rating.count)
       cell.leftImageView.kf.setImage(with: URL(string: info.image))
        return cell
    }
    
  
    func fetchfilms()  {
        let url = "https://fakestoreapi.com/products"
        AF.request(url, method: .get)
            .response { response in
                switch(response.result) {
                case.success(_):
                    do {
                        let users = try JSONDecoder().decode([Message].self, from: response.data!)
                        self.info = users
                        self.tableView.reloadData()
                    }
                    catch let error as NSError {
                        print("Failed to load: \(error.localizedDescription)")
                    }
                    
                case .failure(let error):
                    print("Request error: \(error.localizedDescription)")
                }
            }      
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchfilms()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "MessageCell", bundle: nil), forCellReuseIdentifier: "reusableCell")
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let vc = storyboard?.instantiateViewController (identifier: "ProductInfoViewController") as? ProductInfoViewController {
            vc.descriptionvc = info[indexPath.row].description
            vc.categoryvc = info[indexPath.row].category
            vc.pricevc = Int(info[indexPath.row].price)
            vc.ratingvc = info[indexPath.row].rating.rate
            vc.imagevc = info[indexPath.row].image
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
}

