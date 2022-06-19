//
//  CatalogViewController.swift
//  BeautyProductsApp
//
//  Created by Kristi on 15.06.2022.
//

import UIKit

enum Link: String {
    case nailPolish = "http://makeup-api.herokuapp.com/api/v1/products.json?product_type=nail_polish"
    case lipstick = "http://makeup-api.herokuapp.com/api/v1/products.json?product_type=lipstick"
    case mascara = "http://makeup-api.herokuapp.com/api/v1/products.json?product_type=mascara"
    case eyeshadow = "http://makeup-api.herokuapp.com/api/v1/products.json?product_type=eyeshadow"
    case blush = "http://makeup-api.herokuapp.com/api/v1/products.json?product_type=blush"
    case bronzer = "http://makeup-api.herokuapp.com/api/v1/products.json?product_type=bronzer"
    case eyebrow = "http://makeup-api.herokuapp.com/api/v1/products.json?product_type=eyebrow"
    case eyeliner = "http://makeup-api.herokuapp.com/api/v1/products.json?product_type=eyeliner"
    case foundation = "http://makeup-api.herokuapp.com/api/v1/products.json?product_type=foundation"
    case lipLiner = "http://makeup-api.herokuapp.com/api/v1/products.json?product_type=lip_liner"
    
}

enum UserAction: String, CaseIterable {
    case nailPolish = "Nail polish"
    case lipstick = "Lipstick"
    case mascara = "Mascara"
    case eyeshadow = "Eyeshadow"
    case blush = "Blush"
    case bronzer = "Bronzer"
    case eyebrow = "Eyebrow"
    case eyeliner = "Eyeliner"
    case foundation = "Foundation"
    case lipLiner = "Lip liner"
}

class CatalogController: UITableViewController {
   
    let userActions = UserAction.allCases
    
    var userChoice = Link.lipstick

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userActions.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "catalogCell", for: indexPath) as! CatalogViewCell
        cell.userActionLabel.text = userActions[indexPath.item].rawValue

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let userAction = userActions[indexPath.item]
        switch userAction {
        case .nailPolish:
            userChoice = Link.nailPolish
            performSegue(withIdentifier: "productsShow", sender: nil)
        case .lipstick:
            userChoice = Link.lipstick
            performSegue(withIdentifier: "productsShow", sender: nil)
        case .mascara:
            userChoice = Link.mascara
            performSegue(withIdentifier: "productsShow", sender: nil)
        case .eyeshadow:
            userChoice = Link.eyeshadow
            performSegue(withIdentifier: "productsShow", sender: nil)
        case .blush:
            userChoice = Link.blush
            performSegue(withIdentifier: "productsShow", sender: nil)
        case .bronzer:
            userChoice = Link.bronzer
            performSegue(withIdentifier: "productsShow", sender: nil)
        case .eyebrow:
            userChoice = Link.eyebrow
            performSegue(withIdentifier: "productsShow", sender: nil)
        case .eyeliner:
            userChoice = Link.eyeliner
            performSegue(withIdentifier: "productsShow", sender: nil)
        case .foundation:
            userChoice = Link.foundation
            performSegue(withIdentifier: "productsShow", sender: nil)
        case .lipLiner:
            userChoice = Link.lipLiner
            performSegue(withIdentifier: "productsShow", sender: nil)
        }
    }
    
    // MARK: - Navigation
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let productsVC = segue.destination as? ProductsController else { return }
        productsVC.fetchProducts(product: userChoice)
    }
}
