//
//  ViewController.swift
//  ticTacToe
//
//  Created by ablake on 11/18/16.
//  Copyright © 2016 Student. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{

    @IBOutlet weak var gridView: UIView!
    @IBOutlet weak var labOne: GridLabel!
    @IBOutlet weak var labTwo: GridLabel!
    @IBOutlet weak var labThree: GridLabel!
    @IBOutlet weak var labFour: GridLabel!
    @IBOutlet weak var labFive: GridLabel!
    @IBOutlet weak var labSix: GridLabel!
    @IBOutlet weak var labSeven: GridLabel!
    @IBOutlet weak var labEight: GridLabel!
    @IBOutlet weak var labNine: GridLabel!
    
    var labelsArray : [GridLabel] = []
    
    var myGrid = GridLabel()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        labelsArray = [labOne, labTwo, labThree, labFour, labFive, labSix, labSeven, labEight, labNine]
    }
    
    @IBAction func screenTapped(_ sender: UITapGestureRecognizer)
    {
        for label in labelsArray
        {
            // iterate through labelsArray
            if label.frame.contains(sender.location(in: gridView))
            {
                if label.canTap == true
                {
                    if myGrid.xTurn == true
                    {
                        label.text = "🇰🇵"
                    }
                    else
                    {
                        label.text = "🇰🇷"
                    }
                    myGrid.xTurn = !myGrid.xTurn
                    label.canTap = false
                    myGrid.count += 1
                }
                
            }
        }
        checkWinner()
    }
    
    
    
    func checkWinner()
    {
        if labOne.text == labTwo.text && labTwo.text == labThree.text && labOne.text != ""
        {
            win(labOne.text!)
        }
        if labFour.text == labFive.text && labFive.text == labSix.text && labFour.text != ""
        {
            win(labFour.text!)
        }
        if labSeven.text == labEight.text && labEight.text == labNine.text && labSeven.text != ""
        {
            win(labSeven.text!)
        }
        if labOne.text == labFour.text && labFour.text == labSeven.text && labOne.text != ""
        {
            win(labOne.text!)
        }
        if labTwo.text == labFive.text && labFive.text == labEight.text && labTwo.text != ""
        {
            win(labTwo.text!)
        }
        if labThree.text == labSix.text && labSix.text == labNine.text && labThree.text != ""
        {
            win(labThree.text!)
        }
        if labOne.text == labFive.text && labFive.text == labNine.text && labOne.text != ""
        {
            win(labOne.text!)
        }
        if labThree.text == labFive.text && labFive.text == labSeven.text && labThree.text != ""
        {
            win(labThree.text!)
        }
        if myGrid.count == 9
        {
            win("No one")
        }
    }
    func win(_ winner:String)
    {
        // Displays Alert Controller
        let alert = UIAlertController(title: winner + " is the Winner!", message: nil, preferredStyle: UIAlertControllerStyle.alert)
        let resetButton = UIAlertAction(title: "play again", style: .default, handler: {(sender) in
            for labels in self.labelsArray
            {
                labels.text = ""
                labels.canTap = true
            }
            self.myGrid.xTurn = true
            self.myGrid.count = 0
        })
        alert.addAction(resetButton)
        present(alert, animated: true, completion: nil)
    }
}












