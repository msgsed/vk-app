//
//  DataStorage.swift
//  3l_DmitrievSergey
//
//  Created by Sergey Dmitriev on 11.04.2021.
//

import UIKit

class DataStorage: NSObject {
    static let shared = DataStorage()
    var usersArray = [User]()
    var userGroupList = [Int]()
    var allGroupList = [Int]()
    var groupArray = [Group]()
    
    private override init(){
        super.init()
    }
    
    func firstInit(){        
        self.usersArray.append(User(name: "Bender", type: "Robot", avatar: UIImage(named: "user1"), fotoArray: [UIImage]()))
        self.usersArray[0].fotoArray.append(UIImage(named: "user1Photo1")!)
        self.usersArray[0].fotoArray.append(UIImage(named: "user1Photo2")!)
        self.usersArray[0].fotoArray.append(UIImage(named: "user1Photo3")!)
        self.usersArray[0].fotoArray.append(UIImage(named: "user1Photo4")!)
        self.usersArray[0].fotoArray.append(UIImage(named: "user1Photo5")!)
        
        self.usersArray.append(User(name: "Philip J. Fry", type: "Human", avatar: UIImage(named: "user2"), fotoArray: [UIImage]()))
        self.usersArray[1].fotoArray.append(UIImage(named: "user2Photo1")!)
        self.usersArray[1].fotoArray.append(UIImage(named: "user2Photo2")!)
        self.usersArray[1].fotoArray.append(UIImage(named: "user2Photo3")!)

        self.usersArray.append(User(name: "Turanga Leela", type: "Cyclops", avatar: UIImage(named: "user3"), fotoArray: [UIImage]()))
        self.usersArray.append(User(name: "Zapp Brannigan", type: "Human", avatar: UIImage(named: "user4"), fotoArray: [UIImage]()))
        self.usersArray.append(User(name: "John D. Zoidberg", type: "Lobster", avatar: UIImage(named: "user5"), fotoArray: [UIImage]()))
        self.usersArray.append(User(name: "Amy Wong", type: "Human", avatar: UIImage(named: "user6"), fotoArray: [UIImage]()))
        self.usersArray.append(User(name: "Hubert J. Farnsworth", type: "Human", avatar: UIImage(named: "user7"), fotoArray: [UIImage]()))
        self.usersArray.append(User(name: "Cubert Farnsworth", type: "Clone", avatar: UIImage(named: "user8"), fotoArray: [UIImage]()))
        self.usersArray.append(User(name: "Kif Kroker", type: "", avatar: UIImage(named: "user9"), fotoArray: [UIImage]()))
        self.usersArray.append(User(name: "Nibbler", type: "", avatar: UIImage(named: "user10"), fotoArray: [UIImage]()))

                
        
        self.groupArray.append(Group(id: 0, name: "Office", avatar: UIImage(named: "group1")))
        self.groupArray.append(Group(id: 1, name: "Ship", avatar: UIImage(named: "group2")))
        
        for element in self.groupArray{
            self.allGroupList.append(element.id)
        }

    }
}
