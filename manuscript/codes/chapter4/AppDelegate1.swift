func application(_ application: UIApplication,
                 didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    let center = UNUserNotificationCenter.current()
    // A: 通知許可を求める
    center.requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
        // エラーの場合は出力
        logger.error(error)
        if !granted {
            // 許可されなかった場合は諦める
            logger.info("not granged")
            return
        }
        // C: メインスレッドに戻す
        DispatchQueue.main.async {
            // B: 通知がが許可された場合にdevice tokenをリクエスト
            UIApplication.shared.registerForRemoteNotifications()
        }
    }
    return true
}