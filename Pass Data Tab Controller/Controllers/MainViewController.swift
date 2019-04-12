//
//  ViewController.swift
//  Pass Data Tab Controller
//
//  Created by Viktor on 06/03/2019.
//  Copyright © 2019 viktorsoft. All rights reserved.
//

import UIKit

protocol UITabBarDataSorceDelegate {
    func getText(_ index: Int) -> String
}

extension MainViewController {
    func getText(_ index: Int) -> String {
        
        let textArray: [String] = [
            "Эта история о том, как 90-е чуть не убили во мне программиста. Еще со школы мне нравились точные науки и информатика. В начале 90-х я спаял и настроил свой первый компьютер ZX Spectrum, в народе 'синклер'. На нем я делал небольшие программки на basiс для расчета курсовиков. Я мог сутками писать разные программы, но нужно было зарабатывать. В те времена свободная торговля только зарождалась, и с чем бы ты ни вышел на рынок, все продавалось 'на ура'.",
            "Но торговля отнимала много времени, и хобби пришлось отложить до лучших времен. В 2003 г. для учета в бизнесе потребовалась 1С-ка. С каким интересом я смотрел за программистом, который дописывал всякие фишки, которые я же и придумывал! Однажды он даже не выдержал: Откуда столько идей? Мы плотно сотрудничали на протяжении нескольких лет, а я внимательно смотрел за всем процессом, и как губка все впитывал. Однажды я попробовал сам реализовать очередную доработку и… у меня получилось!",
            "После этого я стал сам сопровождать свою 1С-ку. Моими фишками с удовольствием пользовались сотрудники, но хотелось создавать для большего круга пользователей. Я начал изучать языки для вэба, такие как HTML, CSS, javascript и PHP. Затем загорелся мобильной разработкой и добрался до изучения Swift и iOS SDK."
        ]
        return textArray[index]
    }
}

class MainViewController: UIViewController, UITabBarDataSorceDelegate {
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
        
        delegate = self

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

