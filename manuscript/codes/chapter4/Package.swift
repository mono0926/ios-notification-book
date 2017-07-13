import PackageDescription

let package = Package(
    name: "ApnsPublisher",
    dependencies: [
        .package(url:"https://github.com/matthijs2704/vapor-apns.git", from: "2.0.0")
    ],
    targets: [
        .target(
            name: "ApnsPublisher",
            dependencies: [
                "VaporAPNS"
            ]),
        ]
)