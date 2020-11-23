//
//  ViewController.swift
//  PolyLibrum
//
//  Created by Geunyoun Yi on 08/11/2020.
//

import UIKit




class BookViewController: UIViewController, TranslationManagerDelegate {
    
    
    
    let wordArray = WordModel.toWordArray(sentence: "hello hello hello")
    let imaginaryFont = UIFont(name: "AppleSDGothicNeo-Regular", size: 17)!

    
    
    @IBOutlet var mainView: UIStackView!
    @IBOutlet weak var tablet: UITableView!
    
    
    var dictionaryManager = TranslatonManager()
    var textRenderer: TextRenderer?;
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let viewWidth: CGFloat = 10
        
        
        
        
        textRenderer = TextRenderer(lineLength: viewWidth, remainingSpace: viewWidth)
        
        
        
        dictionaryManager.delegate = self
        tablet.dataSource = self
        
        
        
        tablet.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
        
        
        
        setTableViewLineSpacing(lineFont: imaginaryFont, spacing: 3)
        
//        self.tablet.rowHeight = 300
        
        
    

        
    }
    
    func displayWord(_ word: WordModel) {

    }


}

//MARK: - TableViewDataSource



extension BookViewController: UITableViewDataSource{

    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as! LineTableViewCell
        
        cell.addWords(wordArray)
        cell.setFont(imaginaryFont)
        
        
        return cell
    }

    
    
    //MARK: - Line Spacing Setter
    
    func setTableViewLineSpacing(lineFont: UIFont?, spacing: CGFloat){
        
        
        if let font = lineFont {
            let newHeight = font.lineHeight + 2 * spacing
            self.tablet.rowHeight = newHeight
            print("spacing set")
        }
        
        
    }
    
    
}


//MARK: - Translation Bubble Controller

extension BookViewController {
    
}








    
    










