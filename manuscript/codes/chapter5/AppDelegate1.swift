func application(_ application: UIApplication,
                 didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    let center = UNUserNotificationCenter.current()
    // これを追記してUNUserNotificationCenterのイベントを受け取れるようにする
    center.delegate = self
    center.requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
        logger.error(error)
        if !granted {
            logger.info("not granged")
            return
        }
        DispatchQueue.main.async {
            UIApplication.shared.registerForRemoteNotifications()
        }
    }
    return true
}