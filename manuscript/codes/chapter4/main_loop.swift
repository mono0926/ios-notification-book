// 次のように、常にsandbox・非sandbox環境に送るのもあり
[false, true].forEach { sandbox in
    let pushMessage = ApplePushMessage(topic: nil,
                                       priority: .immediately,
                                       payload: payload,
                                       sandbox: sandbox)
    vaporAPNS.send(pushMessage,
                   to: ["YOUR_DEVICE_TOKEN"]) { result in
    }
}