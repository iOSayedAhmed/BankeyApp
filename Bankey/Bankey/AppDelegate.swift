//
//  AppDelegate.swift
//  Bankey
//
//  Created by Develop on 28/06/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    
    var window: UIWindow?
    
    
    let loginViewController = LoginViewController()
    let onboardingContainerViewController = OnboardingContainerViewController()
    let logoutVC = LogoutViewController()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        loginViewController.delegate = self
        onboardingContainerViewController.delegate = self
        logoutVC.delegate = self
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
      //  window?.rootViewController = loginViewController
        window?.rootViewController = loginViewController
       

        return true
    }


}
extension AppDelegate {
    func setRootViewController(_ vc:UIViewController , animated:Bool = true)  {
        guard animated , let window = window else {
            
            self.window?.rootViewController = vc
            self.window?.makeKeyAndVisible()
            return
        }
        
        window.rootViewController = vc
        window.makeKeyAndVisible()
        UIView.transition(with: window, duration: 0.3, options: .transitionCrossDissolve, animations: nil, completion: nil)
    }
    
}
extension AppDelegate : LoginViewControllerDelegate {
    func didLogin() {
        if LocalState.hasOnboarded {
            setRootViewController(logoutVC)
        }else {
            setRootViewController(onboardingContainerViewController)
        }

    }
    
}
extension AppDelegate : OnboardingContainerViewControllerDelegate {
    func didOnboarding() {
        // some 
    }
    
    func didFinishOnboarding() {
        LocalState.hasOnboarded = true
        setRootViewController(logoutVC)
    }
}
extension AppDelegate:LogoutViewControllerDelegate {
    func didLogout() {
        setRootViewController(loginViewController)
    }
}
