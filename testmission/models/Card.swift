//
//  Card.swift
//  testmission
//
//  Created by MACBOOK on 17/01/2022.
//

import Foundation

struct Card {
    var nameCard : String?
    var status: Bool?
    
    init(nameCard:String?, status:Bool?) {
        self.nameCard = nameCard
        self.status = status
    }
}
