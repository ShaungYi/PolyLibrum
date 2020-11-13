//
//  ViewController.swift
//  PolyLibrum
//
//  Created by Geunyoun Yi on 08/11/2020.
//

import UIKit

class BookViewController: UIViewController, TranslationManagerDelegate {
    
    
    @IBOutlet var mainView: UIStackView!
    
    
    var dictionaryManager = TranslatonManager()
    var textRenderer: TextRenderer?;
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let viewWidth: CGFloat = mainView.frame.width
        
        textRenderer = TextRenderer(lineLength: viewWidth, remainingSpace: viewWidth)
        
        
        
        dictionaryManager.delegate = self
        textRenderer!.delegate = self
        
        
//        let wordArray = WordModel.toWordArray(sentence: "hello hello hello")
        
        addPusherView(mainView)
        
        
        
        let line: UIStackView = addLine()
        
        addWord(line: line, word: WordModel(word: "hello", meanings: ["hola"]))
        
//        textRenderer?.addWords(words: wordArray)
        
    }
    
    func displayWord(_ word: WordModel) {

    }


}



//MARK: - WeatherManagerDelegate


extension BookViewController: TextRendererDelegate{
    
    
    
    func addLine() -> UIStackView{
        
        let line = UIStackView()
        line.axis = NSLayoutConstraint.Axis.horizontal
        line.distribution = UIStackView.Distribution.fillProportionally
        
        
        mainView.addArrangedSubview(line)
        
        removeAllConstraints(view: mainView)
        
//        mainView.addConstraint(NSLayoutConstraint(item: line, attribute: .width, relatedBy: .equal, toItem: mainView, attribute: .width, multiplier: 1, constant: 100))

        
        addPusherView(line)
        
        return line
        
    }
    
    
    
    func addWord(line: UIStackView, word: WordModel) -> UIView {
        
        let frameView = UIView();
        frameView.backgroundColor = .green
        
        
        let wordLabel = UILabel()
        wordLabel.text = word.word
        wordLabel.backgroundColor = .red
        frameView.addSubview(wordLabel)
        
        
        line.addArrangedSubview(frameView)
        line.backgroundColor = .red
        
        
        
        wordLabel.trailingAnchor.constraint(equalTo: frameView.trailingAnchor)
        wordLabel.topAnchor.constraint(equalTo: frameView.topAnchor)
        wordLabel.bottomAnchor.constraint(equalTo: frameView.bottomAnchor)
        wordLabel.leadingAnchor.constraint(equalTo: frameView.leadingAnchor)
        
        
        
        removeAllConstraints(view: frameView)



        let trailingConstraint = NSLayoutConstraint(item: wordLabel, attribute: .trailing, relatedBy: .equal, toItem: frameView, attribute: .trailing, multiplier: 1, constant: 0)

        let leadingConstraint = NSLayoutConstraint(item: wordLabel, attribute: .leading, relatedBy: .equal, toItem: frameView, attribute: .leading, multiplier: 1, constant: 0)

        let topConstraint = NSLayoutConstraint(item: wordLabel, attribute: .top, relatedBy: .equal, toItem: frameView, attribute: .top, multiplier: 1, constant: 0)

        let bottomConstraint = NSLayoutConstraint(item: wordLabel, attribute: .bottom, relatedBy: .equal, toItem: frameView, attribute: .bottom, multiplier: 1, constant: 0)

        frameView.addConstraints([trailingConstraint, leadingConstraint, topConstraint, bottomConstraint])
        
        
        textRenderer?.remainingSpace -= wordLabel.frame.width
        
        
        return frameView
        
    }
    
    
    
    
    func addPusherView( _ mainView: UIStackView){
        
        let pusher = UIView()
        mainView.addSubview(pusher)
        
    }
    
    func wordFits(word frameView: UIView) -> Bool {
        if frameView.frame.width < textRenderer!.remainingSpace {
            return true
        }
        return false
    }
    
    
    func removeAllConstraints(view: UIView){
        for contraint in view.constraints{
            view.removeConstraint(contraint)
        }
    }
}

