# 第5章 プッシュ通知の発行

## 5.1 はじめに

本書はiOSアプリのプッシュ通知について説明しているが、その検証・開発のためにはプッシュ通知の発行の実装も不可欠です。本章では、HTTP/2形式でのプッシュ通知の発行のやり方をいくつか説明していきます。

## 5.2 [cURL](https://curl.haxx.se)での発行


HTTP/2形式ということで、`curl`など使って簡単なスクリプトで送れると想像するかもしれませんが、以下のハードルがあり、ある程度手間がかかります。

- HTTP/2に対応したcurlのインストール
- 第3章で生成したプッシュ通知のKeyファイルなどを用いてJWT認証トークンの生成
  - 期限は1時間なので再生成の必要もあり

以上のハードルさえ越えれば、次のようなシェルスクリプトでプッシュ通知を送ることができます。

<<[TODO: code](codes/chapter5/publish.sh)

ただ、これはiOSアプリの通知についての本としての範疇を超えてしまうと思うため、詳細は割愛して参考リンクの紹介のみにとどめておきます。

- [Using cURL with HTTP/2 on Mac OS X — Simone Carletti](https://simonecarletti.com/blog/2016/01/http2-curl-macosx/)
- [Local and Remote Notification Programming Guide: Communicating with APNs](https://developer.apple.com/library/content/documentation/NetworkingInternet/Conceptual/RemoteNotificationsPG/CommunicatingwithAPNs.html)


実際のアプリを作る際にも、ここを自前で全部書くのではなく、ライブラリ・サービスの利用をおすすめします。

## 5.3 [VaporAPNS](https://github.com/matthijs2704/vapor-apns)の利用

ライブラリはいくつかありますが、[Swift Package Manager](https://github.com/apple/swift-package-manager)(SwiftPM)製のものでは[VaporAPNS](https://github.com/matthijs2704/vapor-apns)がおすすめなので、そちらを紹介します。

_サンプルコードは`ApnsPublisher`ディレクトリに含まれています。_

### SwiftPM実行プログラム雛形の作成

ApnsPublisherというパッケージ名のプッシュ通知送信プログラムを作っていきます。まずは次のように、SwiftPM実行プログラムの雛形を生成します。

```sh
$ mkdir ApnsPublisher
$ cd ApnsPublisher
$ swift package init --type executable
```

次のようなディレクトリ構成になるはずです。

```txt
├── Package.swift
├── README.md
├── Sources
│   └── ApnsPublisher
│       └── main.swift
└── Tests
```

### VaporAPNSのインストール

`Package.swift`の`dependencies`に以下のようにVaporAPNSへの依存を指定します。

<<[TODO: code](codes/chapter5/Package.swift)

次のようにしてビルドすると依存解決されて、VaporAPNSを使えるようになります。VaporAPNSは多くのライブラリに依存しているため少し時間がかかります。

```sh
$ swift build
```

さらに以下を実行してXcodeプロジェクトを生成して、以後のプログラム記述はXcode上で行うのがコード補完も効くためおすすめです。

```sh
swift package generate-xcodeproj
```

### VaporAPNSの利用

`main.swift`で以下のようにVaporAPNSをimportして、プッシュ通知を送る処理を記述して、実行します。初回は[🔧 Installation · matthijs2704/vapor-apns Wiki](https://github.com/matthijs2704/vapor-apns/wiki/%F0%9F%94%A7-Installation)に記載の通り、HTTP/2対応のcurlをインストールする処理もセットで実行されます。

<<[TODO: code](codes/chapter5/main.swift)


詳細は、[Home · matthijs2704/vapor-apns Wiki](https://github.com/matthijs2704/vapor-apns/wiki)に記述されていますが、コード補完やVaporAPNSのソースを読むだけでも書き進められると思います。

基本的に、以下に記載の仕様と一対一対応したようなインターフェースとなっているため、プッシュ通知のすべての機能を制限なく利用できるライブラリとなっています。

- [Local and Remote Notification Programming Guide: APNs Overview](https://developer.apple.com/library/content/documentation/NetworkingInternet/Conceptual/RemoteNotificationsPG/APNSOverview.html#//apple_ref/doc/uid/TP40008194-CH8-SW1)

## 5.4 [Firebase Notifications](https://firebase.google.com/docs/cloud-messaging/)の利用

ライブラリ以外の選択肢としては、プッシュ通知サービスの活用があります。昨今ではライブラリを使って自前でプッシュ通知を発行するのではなく、プッシュ通知サービスの利用が主流ではないでしょうか。いくつかありますが、ここでは筆者が気に入っているFirebase Notificationsを紹介します。他にも良いサービスはありますが、HTTP/2方式に対応しているサービスをおすすめします(例えば現時点では[Amazon SNS](https://aws.amazon.com/sns/)は非対応なので筆者はおすすめしません)。






















