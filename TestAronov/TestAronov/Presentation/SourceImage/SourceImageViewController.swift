//
//  SourceImageViewController.swift
//  TestAronov
//
//  Created by defail on 11/22/20.
//

import UIKit
import WebKit

class SourceImageViewController: UIViewController {

    @IBOutlet private weak var webView: WKWebView!
    
    var url: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let url = url?.formatUrl(), let link = URL(string: url) else { return }
        let request = URLRequest(url: link)
        webView.load(request)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        guard let url = url else { return }
        updateUserActivity(with: url)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        view.window?.windowScene?.userActivity = nil
    }
}

//MARK: State reservation
extension SourceImageViewController {
    func updateUserActivity(with url: String = "") {
        let currentUserActivity = NSUserActivity(activityType: SceneDelegate.MainSceneActivityType())
        currentUserActivity.addUserInfoEntries(from: [SceneDelegate.sourceImageUrl: url])
        
        view.window?.windowScene?.userActivity = currentUserActivity
    }
}
