import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // 在畫面中央畫一個圓
        // 圓的寬與高
        let circleWidth : CGFloat = 80
        let circleHeight : CGFloat = 80
        // 畫圓
        let path = UIBezierPath(ovalIn: CGRect(x: view.frame.width/2 - circleWidth/2, y: view.frame.height/2 - circleHeight/2, width: circleWidth, height: circleHeight))
                
        /* 生成代表形狀的 CAShapeLayer
        CAShapeLayer 可繪製特定的形狀，我們透過它的 path 設定形狀。然而 triangleLayer.path 的型別是 CGPath，所以我們無法指定剛剛生成的 UIBezierPath ，而須利用 path.cgPath 讀取 CGPath 型別的三角形路徑後再存入 triangleLayer.path
        */
        let buildLayer = CAShapeLayer()
        buildLayer.path = path.cgPath
                
        // 填滿形狀的顏色設為透明(預設會填滿黑色)
        buildLayer.fillColor = UIColor.clear.cgColor
                
        // 繪製線條的顏色
        buildLayer.strokeColor = UIColor.black.cgColor
        
        // 繪製線條的粗細
        buildLayer.lineWidth = 8
        
        // 將 CAShapeLayer 加到 view 上顯示出來
        view.layer.addSublayer(buildLayer)
        
        
        // 使用 CABasicAnimation 設定動畫＊＊＊＊＊
        // strokeEnd 為畫線動畫效果。
        // strokeStart 為橡皮擦消除動畫效果
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        
        // 設為 0 表示它將從 CAShapeLayer 路徑的起點開始
        animation.fromValue = 0
        
        // 設為 1 表示動畫將在畫到路徑終點時結束
        animation.toValue = 1
        
        // 設定動畫的時間(秒)
        animation.duration = 2.5
        
        // (可不特別設定)動畫的速度
        animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        
        // (可不特別設定)重覆動畫
        animation.repeatCount = .greatestFiniteMagnitude
                
        // CAShapeLayer 加入設定的動畫條件
        buildLayer.add(animation, forKey: nil)

    }


}

