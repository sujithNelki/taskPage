//
//  ProductInfoViewController.swift
//  taskPage
//
//  Created by Sujith on 08/09/22.
//

import UIKit
import Alamofire

class ProductInfoViewController: UIViewController {

    var info2 :[Message2] = []
    var descriptionvc : String = ""
    var categoryvc : String = ""
    var pricevc : Int = 0
    var ratingvc : Double = 0.0
    var imagevc: String = ""
    
    @IBOutlet var descriptionTxt: UILabel!
    @IBOutlet var categoryTxt: UILabel!
    @IBOutlet var PriceTxt: UILabel!
    @IBOutlet var ratingTxt: UILabel!
    @IBOutlet var upImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchFilms2()
//        descriptionTxt.text = descriptionvc
        categoryTxt.text = categoryvc
        PriceTxt.text = String("\(pricevc)")
        ratingTxt.text = String("\(ratingvc)")
        upImage.kf.setImage(with: URL(string: imagevc))
        

        // Do any additional setup after loading the view.
    }
    func fetchFilms2() {
        let url = "https://fakestoreapi.com/products/:productID"
        AF.request(url, method: .get)
            .response { response in
                switch(response.result) {
                case.success(_):
                    do {
           
                        let users1 = try JSONDecoder().decode([Message2].self, from: response.data ?? Data.empty )
                        self.info2 = users1
                       
                    }
                    catch let error as NSError {
                        print("Failed to load: \(error.localizedDescription)")
                    }
                    
                case .failure(let error):
                    print("Request error: \(error.localizedDescription)")
                }
            }
    }
    
    

    
}
