//
//  ViewController.swift
//  SwiftDiary
//
//  Created by 我是五高你敢信 on 2017/2/18.
//  Copyright © 2017年 我是五高你敢信. All rights reserved.
//

import UIKit

let KNavigationBarColor: (CGFloat, CGFloat, CGFloat) = (121, 193, 76)

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var newModel: CellModel?
    
    fileprivate var dataArray = [CellModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        setNavigationItem()
        
    }

    //MARK:- 设置navigationBar
    fileprivate func setNavigationItem() {
        
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.barTintColor = UIColor(red: KNavigationBarColor.0 / 255.0, green: KNavigationBarColor.1 / 255.0, blue: KNavigationBarColor.2 / 255.0, alpha: 1)
        
        
        /// 设置返回按钮
        let backItem = UIBarButtonItem()
        backItem.title = ""
        navigationItem.backBarButtonItem = backItem
        navigationController?.navigationBar.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)

    }
    
    //storyboard中已经注册cell了 不需要代码注册了
    
//    fileprivate func registerCell() {
//        
//        tableView.register(UINib.init(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
//    }
//    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let newModel = newModel {
            
            dataArray.append(newModel)
            
            
            print(dataArray)
            tableView.reloadData()
        }
    }
}

//MARK:- tableView协议方法
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        let model = dataArray[indexPath.row]
        cell.updateCellWith(model: model)
        
        return cell
    }
}
