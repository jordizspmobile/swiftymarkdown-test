//
//  ViewController.swift
//  MarkDownTest
//
//  Created by Jordi Sanjuan on 19/02/2020.
//  Copyright © 2020 Domestika. All rights reserved.
//

import UIKit
//import MarkdownKit
import Alamofire
import SwiftyMarkdown

class ViewController: UIViewController {
    
    @IBOutlet weak var labelText: UILabel!
    
    //var markdownParser: MarkdownParser?
    var markdownParser: SwiftyMarkdown?
      
    private var testingURL: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.testingURL = "https://raw.githubusercontent.com/apple/swift-evolution/master/proposals/0240-ordered-collection-diffing.md"
        
        requestTestPage()
    }
    
    private func loadText(text: String?, error: Error?) {
        if error == nil {

            if let text = text {
                self.markdownParser = SwiftyMarkdown(string: text)
                
                //h1
                self.markdownParser?.h1.color = .blue
                self.markdownParser?.h1.fontSize = 24
                self.markdownParser?.h1.fontName = UIFont.systemFont(ofSize: 24).fontName
                self.markdownParser?.h1.fontStyle = .bold
                
                //h2
                self.markdownParser?.h2.color = .red
                
                //Body
                self.markdownParser?.body.color = .green
                
                //Code
                self.markdownParser?.code.color = .gray
                
                //Link
                self.markdownParser?.link.fontSize = 20
                
                self.labelText.attributedText = self.markdownParser?.attributedString()
            }
            
            /*
             
             //MarkdownParser
             
             self.markdownParser?.enabledElements = .disabledAutomaticLink
            
            //Bold
            self.markdownParser?.bold.color = .green
            self.markdownParser?.bold.font = UIFont.systemFont(ofSize: 10)
            
            //Header
            self.markdownParser?.header.color = .magenta
            self.markdownParser?.header.font = UIFont.systemFont(ofSize: 30)
            
            //Italic
            self.markdownParser?.italic.color = .yellow
            
            //Code
            self.markdownParser?.code.color = .yellow
            self.markdownParser?.code.font = UIFont.systemFont(ofSize: 12)
             
            
            DispatchQueue.main.async {
                if let text = text {
                    self.labelText.attributedText = self.markdownParser?.parse(text)
                }
            }
             */
        }
    }
    
    private func requestTestPage() {
        AF.request(testingURL).responseString { [weak self] response in
            if let error = response.error {
                self?.loadText(text: nil, error: error)
                return
            }
            if let markdownString = try? response.result.get() {

                DispatchQueue.main.async { [weak self] in
                    self?.loadText(text: markdownString, error: nil)
                }
            }
        }
    }
}

