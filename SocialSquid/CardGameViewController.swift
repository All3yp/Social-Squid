//
//  CardGame View Controller.swift
//  SocialSquid
//
//  Created by Alley Pereira on 5/29/20.
//  Copyright © 2020 Alley Pereira. All rights reserved.
//

import UIKit

class CardGameViewController: UIViewController {
    
    @IBOutlet weak var leftImageView: UIImageView!
    
    @IBOutlet weak var rightImageView: UIImageView!
    
    @IBOutlet weak var leftScoreLabel: UILabel!
    
    @IBOutlet weak var rightScoreLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func dealTapped(_ sender: Any) {
        
        //random cards
//        let playerNumber = Int.random(in: 2...14)
//        let cpuNumber = Int.random(in: 2...14)
        
        
        // mocando o valor temporariamente pra drawn
        let playerNumber = 2
        let cpuNumber = 2
             
        // imageviews update
        leftImageView.image = UIImage(named: "card\(playerNumber)")
        rightImageView.image = UIImage(named: "card\(cpuNumber)")

        if playerNumber > cpuNumber {
            
            // tratando optional
            guard let playerScore = leftScoreLabel.text else {
                return
            }
            var scorePlayerIncremented = Int(playerScore) ?? 0
            scorePlayerIncremented += 1
                // atualizando a tela de pts
            leftScoreLabel.text = String(scorePlayerIncremented)
            print("Player Win", playerNumber)
            
        } else if playerNumber == cpuNumber {
            
            // criando alerta de empate
            let drawnAlert = UIAlertController(title: "Draw", message: nil, preferredStyle: .alert)
            // mostrando alert
            self.present(drawnAlert, animated: true, completion: nil)
            
            // time do alert
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.8) {
                drawnAlert.dismiss(animated: true, completion: nil)
            }
                    
            print("Draw!")
        }  else {
            guard let cpuScore = rightScoreLabel.text else {
                return
            }
            var scoreCPUIncremented = Int(cpuScore) ?? 0
            scoreCPUIncremented += 1
                // atualizando a tela de pts
            rightScoreLabel.text = String(scoreCPUIncremented)
            print("CPU Win", cpuNumber)
            
        }
    }
    
    
    
    
}
/* fazer um guarlet para tratar o optional e nao matae gatin :c
   atribuir um alert quando der empate
 
 Next:
 
 Navigation and Storyboard reference Main to CardGame
 Integration API
*/
