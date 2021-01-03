//
//  ViewController.swift
//  MemeMaker
//
//  Created by KM on 2021/01/03.
//

import UIKit

struct CaptionOption {
    var emoji: String
    var description: String
}

struct CaptionChoice {
    var emoji: String
}


class ViewController: UIViewController {


    @IBOutlet weak var topCaptionSegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var bottomCaptionSegmentedControl: UISegmentedControl!
    @IBOutlet weak var topCaptionLabel: UILabel!
    @IBOutlet weak var bottomCaptionLabel: UILabel!
    @IBOutlet weak var memeImage: UIImageView!
    
    let topChoices = [
        CaptionOption(emoji: "⚽️", description: "soccer"),
        CaptionOption(emoji: "⚾️", description: "baseball"),
    ];
    let bottomChoices = [
        CaptionOption(emoji: "🇰🇷", description: "korean"),
        CaptionOption(emoji: "🗽", description: "foreign"),
    ];
    
    let imageList = [["soccer_korean","baseball_korean"],["soccer_foreign","baseball_foreign"]]
    
    var selectedTopIndex = 0
    var selectedBottomIndex = 0
    
    @IBAction func topSegmentChanged(_ sender: Any) {
        selectedTopIndex = topCaptionSegmentedControl.selectedSegmentIndex
        topCaptionLabel.text = topChoices[selectedTopIndex].description
        
    }
    @IBAction func bottomSegmentChanged(_ sender: Any) {
        selectedBottomIndex = bottomCaptionSegmentedControl.selectedSegmentIndex
        bottomCaptionLabel.text = bottomChoices[selectedBottomIndex].description
    }
    
    
    


    override func viewDidLoad() {
        super.viewDidLoad()
        
        topCaptionSegmentedControl.removeAllSegments()
        for choice in topChoices {
            topCaptionSegmentedControl.insertSegment(withTitle: choice.emoji, at: topChoices.count, animated: false)
        }
        topCaptionSegmentedControl.selectedSegmentIndex = 0
        
        bottomCaptionSegmentedControl.removeAllSegments()
        for bottomChoice in bottomChoices {
            bottomCaptionSegmentedControl.insertSegment(withTitle: bottomChoice.emoji, at: bottomChoices.count, animated: false)
        }
        bottomCaptionSegmentedControl.selectedSegmentIndex = 0
        
        
        if selectedTopIndex == 0 {
            if selectedBottomIndex == 0 {
                topCaptionLabel.text = "한국 축구선수"
                bottomCaptionLabel.text = "손흥민"
            }
            else {
                topCaptionLabel.text = "한국 야구선수"
                bottomCaptionLabel.text = "손흥민"
            }
        } else {
            if selectedBottomIndex == 0 {
                topCaptionLabel.text = "한국 야구선수"
                bottomCaptionLabel.text = "류현진"
            }
            else {
                topCaptionLabel.text = "미국 야구선수"
                bottomCaptionLabel.text = "사실 야구는 잘 모름.."
            }
        }
        
        memeImage.image = UIImage(named: imageList[selectedTopIndex][selectedBottomIndex])
    }

}

