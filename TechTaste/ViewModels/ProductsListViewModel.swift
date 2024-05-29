//
//  ProductsListViewModel.swift
//  TechTaste
//
//  Created by Giovanna Moeller on 29/05/24.
//

import Foundation

class ProductsListViewModel {
    
    var products: [Product] = []
    private var productRepository: ProductsRepository
    
    init(productRepository: ProductsRepository = ProductsRepository()) {
        self.productRepository = productRepository
    }
    
    func getAllProducts() {
        if let products = productRepository.loadProducts() {
            self.products = products
        }
    }
    
    func getNumberOfRowsOfTableView() -> Int {
        return products.count
    }
}
