//
//  BankList.swift
//  knowledge
//
//  Created by Gui on 13/04/26.
//

import UIKit

class BankAccount {
    let name: String
    let account: String
    var balance: Double
    
    init(name: String, account: String, balance: Double) {
        self.name = name
        self.account = account
        self.balance = balance
    }
}
