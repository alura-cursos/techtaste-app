//
//  MainCoordinator.swift
//  TechTaste
//
//  Created by Giovanna Moeller on 29/05/24.
//

import UIKit

class MainCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let homeViewController = HomeViewController()
        navigationController.pushViewController(homeViewController, animated: true)
    }
    
    func showProductList() {
        let productListViewController = ProductsListViewController()
        navigationController.pushViewController(productListViewController, animated: true)
    }

    func showProductDetails(for product: Product) {
        let productDetailsViewModel = ProductDetailsViewModel(product: product)
        let productDetailsViewController = ProductDetailsViewController(viewModel: productDetailsViewModel)
        navigationController.pushViewController(productDetailsViewController, animated: true)
    }
}
