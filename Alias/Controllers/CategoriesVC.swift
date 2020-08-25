//
//  CategoriesVC.swift
//  Alias
//
//  Created by Daria Pr on 19.08.2020.
//  Copyright © 2020 Daria. All rights reserved.
//

import UIKit

class CategoriesVC: UIViewController {
    
    @IBOutlet weak var categoryTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        categoryTable.dataSource = self
        categoryTable.delegate = self
    }

}

extension CategoriesVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ReusableCategory.instance.getCategories().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell") as? CategoryCell {
            let category = ReusableCategory.instance.getCategories()[indexPath.row]
            cell.updateViews(category: category)
            return cell
        } else {
            return CategoryCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let category = ReusableCategory.instance.getCategories()[indexPath.row]
        performSegue(withIdentifier: "GameCategories", sender: category)
    }
    
    //MARK: - For next ViewController
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? GameCategories {
            destinationVC.initCategories(category: sender as! Category)
        }
    }
}
