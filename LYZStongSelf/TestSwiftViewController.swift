//
//  TestSwiftViewController.swift
//  LYZStongSelf
//
//  Created by 刘耀宗 on 2021/6/19.
//

import UIKit

class TestSwiftViewController: UIViewController {

    var testBlock = {}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
        testBlock = { [weak self] in
            //关键代码 if let strongSelf = self
            if let strongSelf = self {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        strongSelf.test()
                }
            }
        }
    }
    
    func test() {
        print("swift 输出了")
    }
    
    deinit {
        print("释放了")
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        navigationController?.dismiss(animated: false, completion: nil)
      
        self.testBlock()
    }

}
