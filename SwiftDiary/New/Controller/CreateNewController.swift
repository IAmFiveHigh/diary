//
//  CreateNewController.swift
//  SwiftDiary
//
//  Created by 我是五高你敢信 on 2017/2/21.
//  Copyright © 2017年 我是五高你敢信. All rights reserved.
//

import UIKit

class CreateNewController: UIViewController {
    @IBOutlet weak var detailTextView: UITextView!

    /// 生成的model
    fileprivate var model: CellModel!
    
    /// 编写内容
    fileprivate var detailText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        setupNavigation()
    }
    
    fileprivate func setupNavigation() {
        
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)]
    }
    
    
    fileprivate func managerTheMessage() {
        
        //1 处理时间
        let date = Date()
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "yyyy.MM/dd /eee/hh:mm"
        var dateString = dateFormat.string(from: date)
        let weekArray = ["星期一","星期二","星期三","星期四","星期五","星期六","星期日"]
        let tmpArray = dateString.components(separatedBy: "/")
        var weekString: String = tmpArray[2]
        switch weekString {
        case "Mon":
            weekString = weekArray[0]
        case "Tue":
            weekString = weekArray[1]
        case "Wed":
            weekString = weekArray[2]
        case "Thu":
            weekString = weekArray[3]
        case "Fri":
            weekString = weekArray[4]
        case "Sat":
            weekString = weekArray[5]
        default:
            weekString = weekArray[6]
        }
        dateString = tmpArray[0] + "/" + tmpArray[1] + weekString + "/" + tmpArray[3]
        
        //2 设置model
        model = CellModel(date: dateString, detailText: detailText, location: "")
    }
    
    
    @IBAction func cofirmButtonClick(_ sender: UIBarButtonItem) {
        
        managerTheMessage()
        
        let viewControllerCount = (navigationController?.viewControllers.count)! - 2
        let mainController = navigationController?.viewControllers[viewControllerCount] as! ViewController
        
        mainController.newModel = model
        navigationController?.popViewController(animated: true)
        
    }

}

extension CreateNewController: UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView) {
        
        detailText = textView.text
    }
}
