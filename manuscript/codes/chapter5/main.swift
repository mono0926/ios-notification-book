import VaporAPNS

let options = try! Options(topic: "YOUR_APP_ID",
                           teamId: "YOUR_TEAM_ID",
                           keyId: "YOUR_KEY_ID",
                           keyPath: "YOUR_KEY_PATH")
let vaporAPNS = try VaporAPNS(options: options)
let payload = Payload(message: "message")
let pushMessage = ApplePushMessage(topic: nil,
                                   priority: .immediately,
                                   payload: payload,
                                   sandbox: true)
vaporAPNS.send(pushMessage,
               to: ["YOUR_DEVICE_TOKEN"]) { result in
                switch result {
                case .success(let apnsId, let deviceToken, let serviceStatus):
                    print("success. apnsId: \(apnsId), deviceToken: \(deviceToken), serviceStatus: \(serviceStatus)")
                case .error(let apnsId, let deviceToken, let error):
                    print("error. apnsId: \(apnsId), deviceToken: \(deviceToken), \(error)")
                case .networkError(let error):
                    print("networkError. \(error)")
                }
}