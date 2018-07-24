//
//  ViewController.swift
//  XYXReusableScrollViewDemo
//
//  Created by Teresa on 2018/7/19.
//  Copyright © 2018年 Teresa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let skimView = XYXSkimView()
    let smallSkimView = XYXSkimView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        skimView.frame = CGRect(x: 0, y: 100, width: UIScreen.main.bounds.width, height: 80)
        skimView.backgroundColor = UIColor.lightGray
        view.addSubview(skimView)
        
        skimView.register(DemoView.self, forCellReuseIdentifier: "DemoView")
        skimView.dataSource = self
        
        smallSkimView.frame = CGRect(x: 0, y: 200, width: UIScreen.main.bounds.width, height: 80)
        smallSkimView.backgroundColor = UIColor.lightGray
        view.addSubview(smallSkimView)
        smallSkimView.register(UINib.init(nibName: "SmallDemoView", bundle: nil), forCellReuseIdentifier: "SmallDemoView")
        smallSkimView.dataSource = self
    }

}

extension ViewController: XYXSkimViewDataSource {
    
    func numberOfRows(in skimView: XYXSkimView) -> Int {
        return 3
    }
    
    func skimView(_ skimView: XYXSkimView, cellForRowAt index: Int) -> XYXSkimViewCell {
        if skimView == self.skimView {
            var cell = skimView.dequeueReusableCell(withIdentifier: "DemoView") as? DemoView
            if cell == nil{
                cell = DemoView.init(reuseIdentifier: "DemoView")
            }
            cell?.flag = index
            return cell!
        }else if skimView == self.smallSkimView {
                var cell = skimView.dequeueReusableCell(withIdentifier: "SmallDemoView") as? SmallDemoView
                if cell == nil{
                    cell = Bundle.main.loadNibNamed("SmallDemoView", owner: nil, options: nil)?.last as? SmallDemoView
                }
                cell?.flag = index
                return cell ?? XYXSkimViewCell()
        }
        return XYXSkimViewCell()
    }
}
