//
//  MakeWordsTVC.swift
//  Alias
//
//  Created by Daria Pr on 21.08.2020.
//  Copyright © 2020 Daria. All rights reserved.
//

import UIKit
import CoreData

class MakeWordsTVC: UITableViewController {
    
    var itemArray = [Item]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var addingWords = AddingWords()
    
    var selectedCategory: PersonalCategories? {
        didSet {
            loadItems()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func addWords(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        textField.keyboardType = .alphabet

        let alert = UIAlertController(title: "Add a new word", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add", style: .default) { (action) in
            
            if let str = textField.text {
                if self.addingWords.checkWhitespaces(str:   str) {
                    let newWordsToCategory = Item(context: self.context)
                    newWordsToCategory.title = textField.text
                    newWordsToCategory.parentCategories = self.selectedCategory
                    self.itemArray.append(newWordsToCategory)
                    self.saveItems()
                }
            }
        }

        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Write a new word"
            textField = alertTextField
        }
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }

    @IBAction func goToPlay(_ sender: UIBarButtonItem) {
        if itemArray.isEmpty {
            let alert = UIAlertController(title: "EMPTY", message: "Add a WORD", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default) { (action) in
            }
            alert.addAction(action)
            
            present(alert, animated: true, completion: nil)
        } else {
            performSegue(withIdentifier: "MakeGameCategoryWords", sender: self)
        }
    }
    
    

    //MARK: - Using Core Data
    
    func saveItems() {
        do {
            try context.save()
        } catch {
            print("Error saving context \(error)")
        }
        
        tableView.reloadData()
    }
    
    func loadItems(with request: NSFetchRequest<Item> = Item.fetchRequest(), predicate: NSPredicate? = nil) {
        
        let categoryPredicate = NSPredicate(format: "parentCategories.name MATCHES %@", selectedCategory!.name!)

        if let additionalPredicate = predicate {
            request.predicate = NSCompoundPredicate(andPredicateWithSubpredicates: [categoryPredicate, additionalPredicate])
        } else {
            request.predicate = categoryPredicate
        }

        do {
            itemArray = try context.fetch(request)
        } catch {
            print("Error fetching data from context \(error)")
        }
        tableView.reloadData()
    }
    
}

extension MakeWordsTVC {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = itemArray[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "MakeWordsTVC", for: indexPath)
        cell.textLabel?.text = item.title
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? MakeGameCategoryWords {
            destinationVC.initOwnWords(wordsArray: itemArray)
        }
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            context.delete(itemArray[indexPath.row])
            itemArray.remove(at: indexPath.row)
            saveItems()
          } else if editingStyle == .insert {
            saveItems()
          }
    }
}
