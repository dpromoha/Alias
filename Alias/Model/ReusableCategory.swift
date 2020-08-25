//
//  ReusableCategory.swift
//  Alias
//
//  Created by Daria Pr on 19.08.2020.
//  Copyright © 2020 Daria. All rights reserved.
//

import Foundation

class ReusableCategory {
    static let instance = ReusableCategory()

    private let categories = [
        Category(title: "ANIMALS", imageName: "horses.jpg"),
        Category(title: "FOOD", imageName: "food2.jpg"),
        Category(title: "IDIOMS", imageName: "books.jpeg"),
        Category(title: "PEOPLE", imageName: "crowd3.jpg")
    ]
    
    private let animals = [
        GameCategoryWords("Penguin"),
        GameCategoryWords("Cow"),
        GameCategoryWords("Fox"),
        GameCategoryWords("Hippopotamus"),
        GameCategoryWords("Unicorn"),
        GameCategoryWords("Crow"),
        GameCategoryWords("Zebra"),
        GameCategoryWords("Chicken"),
        GameCategoryWords("Deer"),
        GameCategoryWords("Donkey")
    ]
    
    private let food = [
        GameCategoryWords("Pizza"),
        GameCategoryWords("Milk"),
        GameCategoryWords("Melon"),
        GameCategoryWords("Hot dog"),
        GameCategoryWords("Taco"),
        GameCategoryWords("Pork"),
        GameCategoryWords("Salt"),
        GameCategoryWords("Banana"),
        GameCategoryWords("Granola"),
        GameCategoryWords("Guacamole")
    ]
    
    private let idioms = [
        GameCategoryWords("In the same boat"),
        GameCategoryWords("Carry a tune"),
        GameCategoryWords("Why the long face?"),
        GameCategoryWords("Eat my words"),
        GameCategoryWords("When in Rome"),
        GameCategoryWords("When pigs fly"),
        GameCategoryWords("Out of this world"),
        GameCategoryWords("Get cold feet"),
        GameCategoryWords("Back to the drawing board"),
        GameCategoryWords("Have a cow")
    ]
    
    private let people = [
        GameCategoryWords("Columbus"),
        GameCategoryWords("Anne Frank"),
        GameCategoryWords("Tesla"),
        GameCategoryWords("Rosa Parks"),
        GameCategoryWords("Henry Ford"),
        GameCategoryWords("Queen Elizabeth I"),
        GameCategoryWords("Sherlock Holmes"),
        GameCategoryWords("Audrey Hepburn"),
        GameCategoryWords("Bill Gates"),
        GameCategoryWords("Coco Chanel")
    ]
    
    func getGameCategoryWords(forCategoryTitle title: String) -> [GameCategoryWords]{
        switch title {
        case "ANIMALS":
            return getWordsAnimal()
        case "FOOD":
            return getWordsFood()
        case "IDIOMS":
            return getWordsIdioms()
        case "PEOPLE":
            return getWordsPeople()
        default:
            return getWordsAnimal()
        }
    }
    
    func getCategories() -> [Category] {
        return categories
    }
    
    func getWordsAnimal() -> [GameCategoryWords] {
        return animals
    }
    
    func getWordsFood() -> [GameCategoryWords] {
        return food
    }
    
    func getWordsPeople() -> [GameCategoryWords] {
        return people
    }
    
    func getWordsIdioms() -> [GameCategoryWords] {
        return idioms
    }
}
