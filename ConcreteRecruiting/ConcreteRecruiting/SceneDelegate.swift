//
//  SceneDelegate.swift
//  ConcreteRecruiting
//
//  Created by Alysson Moreira on 21/12/19.
//  Copyright © 2019 Alysson Moreira. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let scene = (scene as? UIWindowScene) else { return }
        
        self.window = UIWindow(windowScene: scene)
        self.window?.makeKeyAndVisible()
        
        let movieListVC = MovieListViewController(with: MovieListViewModel())
        let listNavigationController = UINavigationController(rootViewController: movieListVC)
        listNavigationController.navigationBar.applyDefaultStyle()
        
        let favoritesVC = FavoritesViewController()
        let favoriteNavigationController = UINavigationController(rootViewController: favoritesVC)
        favoriteNavigationController.navigationBar.applyDefaultStyle()
        
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [listNavigationController, favoriteNavigationController]
        tabBarController.tabBar.applyDefaultStyle()
        
        let images = [
            UIImage(named: "List"),
            UIImage(named: "Favorite-empty")
        ]
        tabBarController.tabBar.items?[0].image = images[0]
        tabBarController.tabBar.items?[1].image = images[1]
        
        self.window?.rootViewController = tabBarController
                
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }

}
