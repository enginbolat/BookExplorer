//
//  ImageEnum.swift
//  Coordinator
//
//  Created by Engin Bolat on 17.09.2025.
//

enum ImageEnum: String {
    case OnboardImage
    case CategoryAdventure = "category_adventure"
    case CategoryFantasy = "category_fantasy"
    case CategoryHorror = "category_horror"
    case CategoryLove = "category_love"
    case CategoryMystery = "category_mystery"
    case CategoryRomance = "category_romance"
    case CategoryScienceFiction = "category_science_fiction"
    case CategoryThriller = "category_thriller"
    
    var value: String {
        self.rawValue
    }
}


