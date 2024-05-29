//
//  ProductsListViewModel.swift
//  TechTaste
//
//  Created by Giovanna Moeller on 29/05/24.
//

import Foundation

class ProductsListViewModel {
    
    var products: Observable<[Product]> = Observable([])
    private var networkingManager: NetworkingManager
    
    init(networkingManager: NetworkingManager = NetworkingManager()) {
        self.networkingManager = networkingManager
    }
    
    func getAllProducts() {
        networkingManager.getProductsList { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let products):
                DispatchQueue.main.async {
                    self.products.value = products
                }
            case .failure(let failure):
                print("Ocorreu um erro ao obter produtos: \(failure.localizedDescription)")
            }
        }
    }
    
    func getNumberOfRowsOfTableView() -> Int {
        return products.value?.count ?? 0
    }
}
