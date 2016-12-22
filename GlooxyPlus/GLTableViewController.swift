//
//  GlooxyMainTableViewController.swift
//  GlooxyPlus
//
//  Created by Franco on 22/12/16.
//  Copyright © 2016 Telecom Italia. All rights reserved.
//

import UIKit

class GLMainTableViewController: UITableViewController {
    var dict: NSDictionary?
    var listItems: [Item] = []
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        //        tableView.register(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: "cellItem")
        dict = readJson()
        parseData()
        
        print("..----")
        print("Grandezza \(listItems.count)")
        
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    func readJson() -> NSDictionary?
    {
        if let url = Bundle.main.url(forResource: "data", withExtension: "json") {
            if let data = NSData(contentsOf: url) {
                do {
                    let dictionary = try JSONSerialization.jsonObject(with: data as Data, options: .allowFragments) as? NSDictionary
                    return dictionary
                } catch {
                    print("Error parse  JSON")
                }
            }
            print("Error read JSON")
        }
        
        return nil
    }
    
    func parseData()
    {
        if let dict = dict as? Dictionary<String,AnyObject>{
            if let categoryItems = dict["items"] as? [[String: AnyObject]]{
                for item in categoryItems {
                    if let name = item["Name"] as? String, let liked = item["Liked"] as? Int,let image = item["Image"] as? String,let price = item["Price"] as? Float, let GLdescription = item["Description"] as? String {
                        print("\(name)")
                        
                        let itemObj = Item(name: name, liked: liked, image: image, price: price, GLdescription: GLdescription)
                        
                        listItems.append(itemObj)
                        
                    }
                }
                tableView.reloadData()
            }
        }
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return listItems.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellItem", for: indexPath) as! ItemTableViewCell
        
        
        cell.GLimageView.isUserInteractionEnabled = true
        if let url = URL(string: listItems[indexPath.row].image!){
            if let data = NSData(contentsOf: url) {
                cell.GLimageView.image = UIImage(data: data as Data)
                cell.GLimageView.tag = indexPath.row
            }
            
            if let priceExist = listItems[indexPath.row].price, let likeExist = listItems[indexPath.row].liked {
                cell.labelPrice.text = "\(priceExist)€ and like: \(likeExist)"
            } else {
                cell.labelPrice.text = "not found price."
            }
            
            if let nameExist = listItems[indexPath.row].name {
                cell.nameLabel.text = "\(nameExist)"
            } else {
                cell.nameLabel.text = "not found name."
            }
            
            cell.descriptionText.isScrollEnabled = false
            cell.descriptionText.isUserInteractionEnabled = false
            if let descriptionExist = listItems[indexPath.row].GLdescription {
                cell.descriptionText.text = "\(descriptionExist)"
            } else {
                cell.descriptionText.text = "not found name."
            }
        }
        
        return cell
    }
    
}
