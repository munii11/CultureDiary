//
//  ShowDiaryViewController.swift
//  2014111516KMH-Project02
//
//  Created by SWUCOMPUTER on 2018. 5. 20..
//  Copyright © 2018년 SWUCOMPUTER. All rights reserved.
//

import UIKit
import CoreData

// 댓글이랑 좋아요는 데이터베이스 끝내고, 이미지 얻어 온 다음에 만들기~
class ShowDiaryViewController: UIViewController {
    @IBOutlet var labelTitle: UILabel!
    @IBOutlet var viewRate: CosmosView!
    @IBOutlet var labelDate: UILabel!
    @IBOutlet var labelGenre: UILabel!
    @IBOutlet var textReview: UILabel!
    var showCultureDiary: NSManagedObject?
    
    func getContext () -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = showCultureDiary?.value(forKey: "title") as? String
        
        if let cultureDiary = showCultureDiary {
            labelTitle.text = showCultureDiary?.value(forKey: "title") as? String
            labelDate.text = showCultureDiary?.value(forKey: "date") as? String
            labelGenre.text = showCultureDiary?.value(forKey: "genre") as? String
            viewRate.rating = (showCultureDiary?.value(forKey: "rate") as? Double)!
            textReview.text = showCultureDiary?.value(forKey: "review") as? String
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func deleteBtn(_ sender: UIButton) {
        let alert = UIAlertController(title:"삭제하시겠습니까?",message: "",preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Yes", style: .cancel, handler: { action in
            // Core Data 내의 해당 자료 삭제
            let context = self.getContext()
            context.delete(self.showCultureDiary!)
            do {
                try context.save()
                print("deleted!")
            } catch let error as NSError {
                print("Could not delete \(error), \(error.userInfo)") }
            // 현재의 View를 없애고 이전 화면으로 복귀
            self.navigationController?.popViewController(animated: true)
        }))
        alert.addAction(UIAlertAction(title: "No", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
    
}
