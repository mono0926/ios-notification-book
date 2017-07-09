func application(_ application: UIApplication,
                  didFailToRegisterForRemoteNotificationsWithError error: Error) {
    // `registerForRemoteNotifications()`を契機に、
    // シミュレーター・設定の誤った実機実行ではこちらに到達
    if TARGET_OS_SIMULATOR == 0 {
        logger.error(error)
    } else {
        logger.info("This is Simulator, so failed to registerForRemoteNotifications\nError: \(error)")
    }
}

func application(_ application: UIApplication,
                  didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
    // `registerForRemoteNotifications()`を契機に、
    // 正しく設定された実機実行ではこちらに到達
    let token = deviceToken.map { String(format: "%.2hhx", $0) }.joined()
    logger.info("token: \(token)")
}