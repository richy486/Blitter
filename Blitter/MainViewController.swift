//
//  MainViewController.swift
//  Blitter
//
//  Created by Richard Adem on 19/1/19.
//  Copyright © 2019 Richard Adem. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
  // MARK: - View
  
  var contentView: MainView {
    guard let contentView = self.view as? MainView else {
        fatalError("Cannot create content view")
    }
    return contentView
  }
  
  // MARK: - View lifecycle
  
  override func loadView() {
    self.view = MainView()
    
      // Relationships between view controller and view
  }

  override func viewDidLoad() {
      super.viewDidLoad()

      // Do any additional setup after loading the view.
  }

  /*
  // MARK: - Navigation

  // In a storyboard-based application, you will often want to do a little preparation before navigation
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      // Get the new view controller using segue.destinationViewController.
      // Pass the selected object to the new view controller.
  }
  */
  
  // MARK: - Memory manager
  
  override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
  }

}
