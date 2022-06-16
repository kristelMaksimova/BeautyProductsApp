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
    
    
    var products: Cosmetics!
    var delegate: ProductsController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameProduct.text = products.name
        priceProduct.text = "$ \(products.price!)"
        brandProduct.text = products.brand
        descriptionProduct.text = products.description
        
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
