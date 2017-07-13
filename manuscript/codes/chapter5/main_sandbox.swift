// Production環境(Ad Hoc・App Storeアプリ)への通知ではsandbox引数をfalseに
let pushMessage = ApplePushMessage(topic: nil,
                                   priority: .immediately,
                                   payload: payload,
                                   sandbox: false)