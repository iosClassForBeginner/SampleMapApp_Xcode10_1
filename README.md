# 第25回: １時間でiPhoneアプリを作ろう
## 地図アプリ

  <div style="text-align:center"><img src ="https://github.com/iosClassForBeginner/SampleMapApp_Xcode10_1/blob/master/gifs%2Bimgs/demo.png" width="50%" height="50%"/></div>

  当アカウントへ訪れていただき、誠にありがとうございます。第25回アプリ教室では、地図アプリを作ります。自分のペースで勉強したい、勉強前に予習したい、内容を復習したい場合、ご利用ください。

## アプリ教室に興味ある方、歓迎します。
  Meetup
  http://www.meetup.com/ios-dev-in-namba/

## 別途アプリ教室(有料)も開いております
  http://ios-class-for-beginners.com/jp

## 問い合わせ
  株式会社ジーライブ
  http://geelive-inc.com

## 開発環境
  Xcode 10.1 / Swift 4.2

  ・<a href="https://github.com/learn-co-students/reading-ios-intro-to-xcode-qa-public-001">What is Xcode?</a>

## アプリ作成手順

## 0, プロジェクト作成

> 0-1. Xcodeを起動。
>
> 0-2. "Create a new Xcode project"を選択。
>
> 0-3. "Single View Application"を選択して"Next"をクリック。
>
> 0-4. "Product name"を適当に入力して"Next"をクリック。
>
> 0-5. プロジェクトの場所を指定して"Create"をクリック。

## 1, アプリをデザインする。

#### 🗂 Main.storyboard

1-1. UILabel（タイトル） を storyboad に追加

> <details><summary>詳細画像をみる</summary><div style="text-align:center"><img src ="https://github.com/iosClassForBeginner/SampleMapApp_Xcode10_1/blob/master/gifs%2Bimgs/1.gif" /></div></details>

1-2. MKMapView（地図表示） を storyboad に追加

> <details><summary>詳細画像をみる</summary><div style="text-align:center"><img src ="https://github.com/iosClassForBeginner/SampleMapApp_Xcode10_1/blob/master/gifs%2Bimgs/2.gif" /></div></details>

## 2, UI部品 を "ViewController.swift" に紐付ける

#### 🗂 Main.storyboard -> ViewController.swift

2-1. MKMapView を "ViewController.swift" に紐付ける（connection を Outlet にする）

★ controlを押しながらドラッグ

> <details><summary>詳細画像をみる</summary><div style="text-align:center"><img src ="https://github.com/iosClassForBeginner/SampleMapApp_Xcode10_1/blob/master/gifs%2Bimgs/3.gif" /></div></details>

## 3, 下記のコードを"ViewController.swift"に追加

#### 🗂 ViewController.swift

```Swift
import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()

        let address = "大阪府大阪市浪速区日本橋４丁目４−５−１５"
        CLGeocoder().geocodeAddressString(address) { [weak mapView] placemarks, error in
            guard let loc = placemarks?.first?.location?.coordinate else {
                return
            }
            print("緯度 : \(loc.latitude)")
            print("経度 : \(loc.longitude)")

            // 地図の中心の緯度・軽度を設定
            mapView?.setCenter(loc ,animated:true)

            // 縮尺を設定
            let region = MKCoordinateRegion(center: loc,
                                            span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02))
            mapView?.setRegion(region,animated:true)

            // マップにピンを刺す
            let annotation = MKPointAnnotation()
            annotation.coordinate = loc
            mapView?.addAnnotation(annotation)
        }

        // マップ表示形式
        mapView.mapType = MKMapType.standard
        // mapView.mapType = MKMapType.hybrid
        // mapView.mapType = MKMapType.satellite
    }
}
```
