//
//  ProductDetailsController.swift
//  BeautyProductsApp
//
//  Created by Kristi on 16.06.2022.
//

import UIKit

class ProductDetailsController: UIViewController {

    @IBOutlet var imageProduct: UIImageView!
    @IBOutlet var priceProduct: UILabel!
    @IBOutlet var brandProduct: UILabel!
    @IBOutlet var nameProduct: UILabel!
    @IBOutlet var descriptionProduct: UILabel!
    @IBOutlet var gradeProduct: UILabel!
    
    var products: Cosmetics!
    var delegate: ProductsController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interfaceElements()
    }
    
    private func ratingDisplay(_ rating: Double) -> String {
       var result = ""
        if rating < 1.0 { result = "☆" }
        else if rating < 1.6 { result = "★" }
        else if rating < 2.6 { result = "★★" }
        else if rating < 3.6 { result = "★★★" }
        else if rating < 4.6 { result = "★★★★" }
        else { result = "★★★★★" }
        return result
    }
    private func interfaceElements() {
        nameProduct.text = products.name
        priceProduct.text = "$ \(products.price!)"
        brandProduct.text = products.brand
        descriptionProduct.text = products.description
        gradeProduct.text = " \(products.rating ?? 0) \(ratingDisplay(products.rating ?? 0))"
        navigationItem.title = products.name
        
        DispatchQueue.global().async {
            guard let stringURL = self.products.image_link else { return }
            guard let url = URL(string: stringURL) else { return }
            guard let imageData = try? Data(contentsOf: url) else { return }
            DispatchQueue.main.async {
                self.imageProduct.image = UIImage(data: imageData)
            }
        }
    }
}
