//
//  SceneDelegate.swift
//  TestAronov
//
//  Created by defail on 11/21/20.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    // State restoration keys:
    static let sourceImageUrl = "sourceImageUrl"

    static let MainSceneActivityType = { () -> String in
        let activityTypes = Bundle.main.infoDictionary?["NSUserActivityTypes"] as? [String]
        return activityTypes![0]
    }

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let userActivity = connectionOptions.userActivities.first ?? session.stateRestorationActivity else { return }
        scene.userActivity = userActivity
        guard let _ = (scene as? UIWindowScene) else { return }
    }

    
    func sceneWillResignActive(_ scene: UIScene) {
        if let userActivity = window?.windowScene?.userActivity {
            userActivity.resignCurrent()
        }
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        if let userActivity = window?.windowScene?.userActivity {
            userActivity.becomeCurrent()
        }
    }

    func stateRestorationActivity(for scene: UIScene) -> NSUserActivity? {
        return scene.userActivity
    }
}

