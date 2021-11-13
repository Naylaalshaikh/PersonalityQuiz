//
//  ResultsViewController.swift
//  PersonalityQuiz
//
//  Created by Sayed Husain Majed on 28/10/2021.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet var resultAnswerLabel: UILabel!
    @IBOutlet var resulteDefinitionLabel: UILabel!
    
    var responses: [Answer]
    
    init?(coder: NSCoder, responses: [Answer]) {
        self.responses = responses
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculatePersonalityResult()
        navigationItem.hidesBackButton = true
        // Do any additional setup after loading the view.
    }
    
    func calculatePersonalityResult() {
        let frequnceyOfAnswers = responses.reduce(into: [ AnimalType: Int]())
            { (counts, answer) in
            if let existingCount = counts[answer.type]{
                counts[answer.type] = existingCount + 1
            } else {
                counts[answer.type] = 1
            }
        }
        let frequentAnswersSorted = frequnceyOfAnswers.sorted(by: { (pair1, pair2) in
            return pair1.value > pair2.value
        })
        
        let mostCommonAnswer = frequentAnswersSorted.sorted {$0.1 > $1.1 }.first!.key
        
        resultAnswerLabel.text = "You are a \(mostCommonAnswer.rawValue)!"
        resulteDefinitionLabel.text = mostCommonAnswer.definition
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
