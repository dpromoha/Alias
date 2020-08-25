//
//  MakeCategoriesTVC.swift
//  Alias
//
//  Created by Daria Pr on 21.08.2020.
//  Copyright © 2020 Daria. All rights reserved.
//

import UIKit
import CoreData

class MakeCategoriesTVC: UITableViewController {

    var categoriesArray = [PersonalCategories]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var addingWords = AddingWords()

    override func viewDidLoad() {
        super.viewDidLoad()

        loadItems()
    }

    //MARK: - Using UIBarButtonItem for adding new categories
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()

        let alert = UIAlertController(title: "Add a new category", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add", style: .default) { (action) in
            
            if let str = textField.text {
                if self.addingWords.checkWhitespaces(str: str) {
                    let newPersonalCategory = PersonalCategories(context: self.context)
                    newPersonalCategory.name = textField.text
                    self.categoriesArray.append(newPersonalCategory)
                    self.saveItems()
                }
            }
            
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new category"
            textField = alertTextField
        }
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
    }
    
    //MARK: - Using CoreData for saving data
    
    func saveItems() {
        
        do {
            try context.save()
        } catch {
            print("Error saving context \(error)")
        }
        
        tableView.reloadData()
    }
    
    func loadItems(with request: NSFetchRequest<PersonalCategories> = PersonalCategories.fetchRequest()) {
        do {
            categoriesArray = try context.fetch(request)
        } catch {
            print("Error fetching data from context \(error)")
        }
        tableView.reloadData()
    }

}

extension MakeCategoriesTVC {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoriesArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let category = categoriesArray[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "MakeCategoriesTVC", for: indexPath)
        cell.textLabel?.text = category.name
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "MakeWordsTVC", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! MakeWordsTVC
        if let indexPath = tableView.indexPathForSelectedRow {
            destinationVC.selectedCategory = categoriesArray[indexPath.row]
        }
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            context.delete(categoriesArray[indexPath.row])
            categoriesArray.remove(at: indexPath.row)
            saveItems()
          } else if editingStyle == .insert {
            saveItems()
          }
    }
}
