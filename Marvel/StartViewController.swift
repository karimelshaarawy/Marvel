//
//  StartViewController.swift
//  Marvel
//
//  Created by Karim Elshaarawy on 13/01/2024.
//

import UIKit

class StartViewController: UIViewController {

    @IBOutlet weak var progressBar: UIProgressView!
    
    var progressTimer: Timer!
    let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
    var progressDone = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vc.charactersViewModel.updateCharacterList(offset: 0)
        vc.offset += 5
        progressBar.progress = 0.0
        progressTimer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateProgressView), userInfo: nil, repeats: true)
        // Do any additional setup after loading the view.
    }
    @objc func updateProgressView(){
           progressBar.progress += 0.1
           progressBar.setProgress(progressBar.progress, animated: true)
        if(progressBar.progress == 1.0 && vc.charactersViewModel.loadedFlag)
           {
               progressTimer.invalidate()
//               let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
               self.navigationController?.pushViewController(vc, animated: true)
           }
       }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
