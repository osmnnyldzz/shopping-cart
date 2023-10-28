//
//  DBManager.swift
//  shopping-cart
//
//  Created by Osman Yıldız on 28.10.2023.
//

import CoreData

final class DBManager {
    static let shared = DBManager()
    
    lazy var persistentContainer: NSPersistentContainer = {
        let persistentContainer = NSPersistentContainer(name: "shopping_cart")
        persistentContainer.loadPersistentStores { _, error in
            print(error?.localizedDescription ?? "")
        }
        return persistentContainer
    }()
    
    var moc: NSManagedObjectContext {
        persistentContainer.viewContext
    }
    
    func addToCart(_ product: Product) {
        let cart = CartDB(context: moc)
        cart.setValue(product.id, forKey: "productId")
        cart.setValue(product.title, forKey: "productTitle")
        cart.setValue(product.price, forKey: "productPrice")
        cart.setValue(product.image, forKey: "productImage")
        cart.setValue(product.raiting?.count, forKey: "productCount")
        
        do {
            try moc.save()
        } catch  {
            print(error)
        }
    }
    
    func fetchCart() -> [Product] {
        do {
            let fetchRequest = NSFetchRequest<CartDB>(entityName: "CartDB")
            
            let cart = try moc.fetch(fetchRequest)
            
            let mappedCart = cart.compactMap { item in
                Product(id:item.productId,title:item.productTitle,price: item.productPrice, image: item.productImage)
            }
            
            return mappedCart
        } catch  {
            print(error)
            return []
        }
    }
        
    func deleteCart(completion: @escaping(_ process:Bool) -> Void) {
        do {
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "CartDB")
            let batch = NSBatchDeleteRequest(fetchRequest: fetchRequest)
            try moc.execute(batch)
            completion(true)
        } catch _ {
            completion(false)
        }
    }
    
}
