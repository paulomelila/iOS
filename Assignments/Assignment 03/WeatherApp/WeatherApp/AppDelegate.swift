//
//  AppDelegate.swift
//  WeatherApp
//
//  Created by Derrick Park on 2017-05-26.
//  Copyright © 2017 Derrick Park. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    let van = City(name: "Vancouver", temperature: 18, precipitation: "0%")
    let rio = City(name: "Rio de Janeiro", temperature: 29, precipitation: "0%")
    let par = City(name: "Paris", temperature: 19, precipitation: "25%")
    let mad = City(name: "Madrid", temperature: 28, precipitation: "40%")
    let sea = City(name: "Seattle", temperature: 18, precipitation: "10%")
    
    let vanVC = CityViewController()
    let rioVC = CityViewController()
    let parVC = CityViewController()
    let madVC = CityViewController()
    let seaVC = CityViewController()
    
    let detailedVC = DetailedViewController()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let tabBarController = UITabBarController()
        window?.rootViewController = tabBarController
        
        vanVC.city = van
        rioVC.city = rio
        parVC.city = par
        madVC.city = mad
        seaVC.city = sea
        
        vanVC.tabBarItem = UITabBarItem(title: van.name, tag: 0)
        rioVC.tabBarItem = UITabBarItem(title: rio.name, tag: 1)
        parVC.tabBarItem = UITabBarItem(title: par.name, tag: 2)
        madVC.tabBarItem = UITabBarItem(title: mad.name, tag: 3)
        seaVC.tabBarItem = UITabBarItem(title: sea.name, tag: 4)
        
        let vanNC = UINavigationController(rootViewController: vanVC)
        let rioNC = UINavigationController(rootViewController: rioVC)
        let parNC = UINavigationController(rootViewController: parVC)
        let madNC = UINavigationController(rootViewController: madVC)
        let seaNC = UINavigationController(rootViewController: seaVC)
        
        let navigators = [vanNC, rioNC, parNC, madNC, seaNC]
        
        tabBarController.viewControllers = navigators
        
        window?.makeKeyAndVisible()
        
        return true
    }
}
