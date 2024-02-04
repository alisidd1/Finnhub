//
//  SceneDelegate.swift
//  FinnHub
//
//  Created by Ali Siddiqui on 1/29/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = createTabBar()
        window.makeKeyAndVisible()
        self.window = window
        

    }
    
    func createTabBar() -> UINavigationController{
        let tabBarController = UITabBarController()
        let SVC = SymbolViewController()
        let SDC = SymbolDetailsViewController()
        let StrVC = StreamingViewController()
        let MVC = MarketViewController()
        tabBarController.viewControllers = [SVC, SDC, StrVC, MVC]
        let navController = UINavigationController(rootViewController: tabBarController)
        
        var customTabBarItem1 = UITabBarItem(title: "Quote", image: nil, selectedImage: nil)
        SVC.tabBarItem = customTabBarItem1
        let customTabBarItem2 = UITabBarItem(title: "Symbol Details", image: nil, selectedImage: nil)
        SDC.tabBarItem = customTabBarItem2
        let customTabBarItem3 = UITabBarItem(title: "Streaming Quotes", image: nil, selectedImage: nil)
        StrVC.tabBarItem = customTabBarItem3
        let customTabBarItem4 = UITabBarItem(title: "Market", image: nil, selectedImage: nil)
        MVC.tabBarItem = customTabBarItem4

        return navController
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
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

        // Save changes in the application's managed object context when the application transitions to the background.
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }


}

