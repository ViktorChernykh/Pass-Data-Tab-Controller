//
//  ViewController.swift
//  Pass Data Tab Controller
//
//  Created by Viktor on 06/03/2019.
//  Copyright © 2019 viktorsoft. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    // MARK: - @IBOutlets
    @IBOutlet weak var textLabel: UILabel!
    
    // MARK: - Properties
    var delegate: UITabBarDataSorceDelegate!
    
    var backgroundColor: UIColor? {
        didSet {
            self.view.backgroundColor = backgroundColor
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegate = DataText()

        textLabel.text = delegate.getText(self.tabBarItem.tag)
    }
    
    // MARK: - initialization
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let backgroundColor = backgroundColor {
            self.view.backgroundColor = backgroundColor
        }
    }

    @IBAction func choiceSegment(_ segmentedControl: UISegmentedControl) {
        
        //for viewController in tabBarController!.viewControllers! {
        
        // second variant
        tabBarController?.viewControllers?.forEach({ (viewController) in
            let mainViewController = viewController as! MainViewController
            
            if segmentedControl.selectedSegmentIndex == 1 {
                mainViewController.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                mainViewController.textLabel.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            } else {
                mainViewController.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                mainViewController.textLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            }
        })
    }
    
}

