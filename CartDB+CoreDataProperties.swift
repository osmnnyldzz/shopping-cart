//
//  CartDB+CoreDataProperties.swift
//  shopping-cart
//
//  Created by Osman Yıldız on 28.10.2023.
//
//

import Foundation
import CoreData


extension CartDB {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CartDB> {
        return NSFetchRequest<CartDB>(entityName: "CartDB")
    }

    @NSManaged public var productId: Int16
    @NSManaged public var productTitle: String?
    @NSManaged public var productPrice: Double
    @NSManaged public var productImage: String?
    @NSManaged public var productCount: Int16

}

extension CartDB : Identifiable {

}
