import Foundation
import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject : AnyObject]?) -> Bool {
        var rootController = ShowRunnersController()
        
        var navigationController = UINavigationController(rootViewController: rootController)
        navigationController.toolbarHidden = false
        
        var window = UIWindow(frame: UIScreen.mainScreen().bounds)
        self.window = window
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
        return true
    }
}
