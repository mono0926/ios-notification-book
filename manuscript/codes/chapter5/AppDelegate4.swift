extension AppDelegate: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification,
                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        logger.info("applicationState: \(UIApplication.shared.applicationState)")
        let userInfo = notification.request.content.userInfo
        logger.info("userInfo: \(userInfo)")
        // これを呼ぶとアプリ起動中でも通知バナーが出せる
        completionHandler([.badge, .alert, .sound])
    }
}