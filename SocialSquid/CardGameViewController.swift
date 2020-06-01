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
    
    lazy var drawAlert: DrawAlert = {
        DrawAlert()
    }()
    
    
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
            
            self.view.addSubview(drawAlert)
            drawAlert.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
            
//                self.view.centerYAnchor.constraint(equalTo: drawAlert.centerYAnchor, constant: 0),
                self.view.bottomAnchor.constraint(equalTo: drawAlert.bottomAnchor, constant: 200),
                self.view.centerXAnchor.constraint(equalTo: drawAlert.centerXAnchor, constant: 0)
//                drawAlert.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 300),
//                drawAlert.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
                
            ])
            
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.7) { [weak self] in
                self?.drawAlert.removeFromSuperview()
            }
            
        } else {
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



/*
 TODO:
 
 fazer um guarlet para tratar o optional e nao matae gatin :c [ OK ]
 atribuir um alert quando der empate [ OK ]
 
 Customizar o alert com tamanho e talvez, e ver se dá p por constraints nele
 
 REFATORAR O CODIGO PRA FUNÇÃO E NAO FICAR ESSA PAPAGAIADA QUE ESTÁ DE BAGUNÇA SEU LIXO
 
 Next:
 
 Navigation and Storyboard reference Main to CardGame
 Integration API
 */
