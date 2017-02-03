import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white

        let mailBoxNavigationCotroller = UINavigationController(rootViewController: MailboxViewController())
        window?.rootViewController = mailBoxNavigationCotroller

        window?.makeKeyAndVisible()
        return true
    }

}
