//
//  AppCoordinator.swift
//  BoredIdeas
//
//  Created by Никита Чечнев on 18.05.2023.
//

import UIKit

final class AppCoordinator {
    
    private lazy var navigationControllers = AppCoordinator.setupNavControllers()
    private lazy var tabBarController = UITabBarController()
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
        setupUI()
    }
    
    func start() {
        setupRandomTab()
        setupGenerateTab()
        let navigationControllers = NavigationControllerKeys.allCases.compactMap {
            self.navigationControllers[$0]
        }
        tabBarController.setViewControllers(navigationControllers, animated: false)
        
        window.rootViewController = tabBarController
        window.makeKeyAndVisible()
    }
}

private extension AppCoordinator {
    static func setupNavControllers() -> [NavigationControllerKeys: UINavigationController] {
        var result: [NavigationControllerKeys: UINavigationController] = [:]
        NavigationControllerKeys.allCases.forEach { navKey in
            let navigationController = UINavigationController()
            let tabBarItem = UITabBarItem(title: navKey.title,
                                          image: navKey.image,
                                          tag: navKey.rawValue)
            navigationController.tabBarItem = tabBarItem
            result[navKey] = navigationController
        }
        return result
    }
    
    func setupRandomTab() {
        guard let navigationController = navigationControllers[.random] else {
            fatalError("Navigation controller missing")
        }
        let randomIdeaVC = RandomIdeaVC()
        navigationController.setViewControllers([randomIdeaVC], animated: false)
        randomIdeaVC.navigationItem.title = NavigationControllerKeys.random.title
    }
    
    func setupGenerateTab() {
        guard let navigationController = navigationControllers[.generate] else {
            fatalError("Navigation controller missing")
        }
        let generateIdeaVC = GenerateIdeaVC()
        navigationController.setViewControllers([generateIdeaVC], animated: false)
        generateIdeaVC.navigationItem.title = NavigationControllerKeys.generate.title
    }
    
    func setupUI() {
        UINavigationBar.appearance().barTintColor = .systemBackground
        UINavigationBar.appearance().tintColor = .label
        
        UITabBar.appearance().barTintColor = .systemBackground
        UITabBar.appearance().tintColor = .label
    }
}

fileprivate enum NavigationControllerKeys: Int, CaseIterable{
    case random
    case generate
    
    var title: String {
        switch self {
        case .random:
            return "Random Idea"
        case .generate:
            return "Generate Idea"
        }
    }
    
    var image: UIImage? {
        switch self {
        case.random:
            return UIImage(systemName: "questionmark.circle.fill")
        case .generate:
            return UIImage(systemName: "checklist")
        }
    }
}
