//
//  LadiesGalleryVC.swift
//  AlamaFireTest2
//
//  Created by Nataliia Klemenchenko on 29.03.17.
//  Copyright © 2017 tingoit. All rights reserved.
//

import UIKit
import SwiftyJSON

class LadiesListVC: UIViewController {
    
    @IBOutlet weak var listCollectionView: UICollectionView!
    
    @IBOutlet weak var activityIdenCollection: UIActivityIndicatorView!
    var listProfile:[JSON] = []
    
    override func viewDidLoad() {
        activityIdenCollection.isHidden = false
        activityIdenCollection.startAnimating()
        super.viewDidLoad()
        let tokenKey = KeyChain.getToken()
        print("tokenKey = \(tokenKey)")
        guard tokenKey != nil else {
            goLogin()
            return
        }
        ListOnline().fetchOnlineList { (listProfile) in
            if let listProfile = listProfile{
                self.listProfile = listProfile
                print("count = \(listProfile.count)")
                self.listCollectionView.reloadData()
            }
            self.activityIdenCollection.stopAnimating()
            self.activityIdenCollection.isHidden = true
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func goLogin(){
        let loginVC = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
        self.navigationController?.pushViewController(loginVC, animated: true)
    }
    
}

extension LadiesListVC: UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(listProfile.count)
        return listProfile.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "listVCell", for: indexPath) as! listVCell
        cell.nameLabel.text = listProfile[indexPath.row]["name"].string
        print("photo = \(listProfile[indexPath.row]["photo"].string)")
        
        let imageData = NSData(contentsOf: URL(string: "https://www.bridge-of-love.com/data/files/images/lady/avatar/user_121887/small_201611091615168354.jpg")!)
        cell.photoAvaImage.image = UIImage(data: imageData as! Data)
        cell.activityIndAva.startAnimating()
        cell.activityIndAva.isHidden = false
        if let path = listProfile[indexPath.row]["photo"].string{
            if let url = URL(string: urlPrefixMainPhoto + path){
                
                DispatchQueue.global(qos: .default).async {
                    let imageData = NSData(contentsOf: url)
                    
                    DispatchQueue.main.async {
                        if imageData != nil{
                            cell.photoAvaImage.image = UIImage(data: imageData as! Data)
                            cell.activityIndAva.stopAnimating()
                            cell.activityIndAva.isHidden = true
                        }
                    }
               
                }
                
            }
        }
        return cell
    }
    
}
