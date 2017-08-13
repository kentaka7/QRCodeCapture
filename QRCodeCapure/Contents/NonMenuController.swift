//
//  NonMenuController.swift
//  QRCodeCapure
//
//  Created by takakura naohiro on 2017/08/13.
//  Copyright © 2017年 GeoMagnet. All rights reserved.
//

import UIKit

class NonMenuController: UIViewController {
    
    weak var delegate: LeftMenuProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.removeNavigationBarItem()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        coordinator.animate(alongsideTransition: nil, completion: { (context: UIViewControllerTransitionCoordinatorContext!) -> Void in
            guard let vc = (self.slideMenuController()?.mainViewController as? UINavigationController)?.topViewController else {
                return
            }
            if vc.isKind(of: NonMenuController.self)  {
                self.slideMenuController()?.removeLeftGestures()
                self.slideMenuController()?.removeRightGestures()
            }
        })
    }
    
    @IBAction func didTouchToMain(_ sender: UIButton) {
        delegate?.changeViewController(LeftMenu.main)
    }
}
