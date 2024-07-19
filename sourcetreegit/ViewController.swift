//
//  ViewController.swift
//  sourcetreegit
//
//  Created by 株式会社三星製作所 on 2024/07/19.
//

import UIKit

class RunOrStopView: UIView {
    var clock:[[Int]] = []
    var cycle:Int = 0
    var limit:Int = 0
    var defaultColor:UIColor = .green
    var limitOverColor:UIColor = .red
    var index:Int = 0
    
    var numberOfRects: Int = 5 // 描画する四角いビューの数
        var rectHeight: CGFloat = 50.0 // 四角いビューの高さ
        var padding: CGFloat = 10.0 // パディング
        var rectColor: UIColor = .blue // 四角いビューの色

    override func layoutSubviews() {
        super.layoutSubviews()

        // Remove any existing subviews before drawing
        for subview in self.subviews {
        subview.removeFromSuperview()
        }

        var gaugeWidth: [CGFloat] = []
        for _ in 0..<clock.count {
            gaugeWidth.append(10)
        }


        let width = self.bounds.width
        let totalHeight = CGFloat(clock.count) * (rectHeight + padding) - padding

        for (index, gaugeCell) in gaugeWidth.enumerated() {
            let barY = CGFloat(index) * (rectHeight + padding)
            let gaugeView = UIView(frame: CGRect(x: 0, y: barY, width: width, height: rectHeight))
            gaugeView.backgroundColor = defaultColor
            self.addSubview(gaugeView)
        }
    }
        }
    


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var clock:[[Int]] = [[8,0,9,0,0],[9,0,10,0,0],[10,0,11,0,0]]
    var cycle:Int = 15
    var limit:Int = 30
    

    @IBOutlet weak var testGaugeTable: UITableView!
 //   @IBOutlet weak var gaugeView: UIScrollView!
    
    var gauge: RunOrStopView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("developzsgdxfhcgjvb")
        testGaugeTable.register(UINib(nibName: "GaugeViewCell", bundle: nil), forCellReuseIdentifier: "GaugeViewCell")
        
        testGaugeTable.delegate = self
        testGaugeTable.dataSource = self
        
    }
    
    func gaugeAddViews(gaugeView:UIView,index:Int) {
        super.viewDidLayoutSubviews()
        gauge?.removeFromSuperview()
        gauge = RunOrStopView(frame: gaugeView.bounds)
        gaugeView.addSubview(gauge)
        gauge.clock = clock
        gauge.cycle = cycle
        gauge.limit = limit
        gauge.index = index
        gauge.setNeedsDisplay()
        gauge.setNeedsLayout()
        print("asdfghjkhgfdsdfghjkjhgfdsdfghjhgfds")
        
    }

    // データの数（＝セルの数）を返すメソッド
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return clock.count
    }

    // 各セルの内容を返すメソッド
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "GaugeViewCell") as? GaugeViewCell else {
            return UITableViewCell()
        }
        let stringMinute = minuteStringChange(index: indexPath.row)
        
        cell.startHour.text = String(clock[indexPath.row][0])
        cell.startMinute.text = stringMinute[0]
        cell.endHour.text = String(clock[indexPath.row][2])
        cell.endMinute.text = stringMinute[1]
        
        gaugeAddViews(gaugeView: cell.gaugeView, index: indexPath.row)
        
        return cell
    }
    
    // 各セルを選択した時に実行されるメソッド
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    
    func minuteStringChange(index:Int) -> [String]{
        var stringStartMinute = String(clock[index][1])
        if String(clock[index][1]).count == 1{
            stringStartMinute = "0" + stringStartMinute
        }
        var stringEndMinute = String(clock[index][3])
        if String(clock[index][3]).count == 1{
            stringEndMinute = "0" + stringEndMinute
        }
        return [stringStartMinute,stringEndMinute]
    }

}

