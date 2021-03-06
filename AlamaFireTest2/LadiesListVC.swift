//
//  LadiesGalleryVC.swift
//  AlamaFireTest2
//
//  Created by Nataliia Klemenchenko on 29.03.17.
//  Copyright © 2017 tingoit. All rights reserved.
//

import UIKit
import SwiftyJSON

class LadiesListVC: UIViewController, UICollectionViewDelegate {
    
    @IBOutlet weak var listCollectionView: UICollectionView!
    
    @IBOutlet weak var activityIdenCollection: UIActivityIndicatorView!
    var arrayLady:[Lady] = []
    var pageNumber: Int32 = 0
    
    override func viewDidLoad() {
        activityIdenCollection.isHidden = false
        activityIdenCollection.startAnimating()
        super.viewDidLoad()
        let tokenKey = KeyChain.getToken()
        //print("tokenKey = \(tokenKey)")
        guard tokenKey != nil else {
            goLogin()
            return
        }
        
        updateArrayLady()
            

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
        return arrayLady.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == arrayLady.count - 1{
            print("-1")
            loadMore()
            //listCollectionView.reloadData()
            //print(pageNumber)
        }
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "listVCell", for: indexPath) as! listVCell
        let lady = arrayLady[indexPath.row]
        cell.nameLabel.text = lady.name
        cell.activityIndAva.startAnimating()
        cell.activityIndAva.isHidden = false
        cell.idLabel.text = lady.id?.description
        //print("lady.id = \(lady.id)")
        //print("lady.avatarURL = \(lady.avatarURL)")
        if let url = lady.avatarURL{
            DispatchQueue.global(qos: .userInitiated).async {
                let imageData = NSData(contentsOf: url)
                
                DispatchQueue.main.async {
                    if imageData != nil{
                        cell.photoAvaImage.image = UIImage(data: imageData as! Data)
                        //print("url = \(url)")
                        cell.activityIndAva.stopAnimating()
                        cell.activityIndAva.isHidden = true
                        print("pageNumber = \(self.pageNumber)")
                    }
                }
                
            }
            
            
        }
        return cell
    }
    
    
    
    
    
}

extension LadiesListVC{
    func loadMore(){
        updateArrayLady()
        //listCollectionView.reloadData()
    }
    
    func updateArrayLady(){
        DispatchQueue.global(qos: .userInitiated).async {
            LadiesFilters().fetchOnlineList(page: self.pageNumber, completionHandler: { (arrayLady) in
                if let arrayLady = arrayLady{
                    self.arrayLady += arrayLady
                    print("arrayLady gotov")
                    DispatchQueue.main.async {
                        
                        self.listCollectionView.reloadData()
                        print("reload data")
                        self.activityIdenCollection.stopAnimating()
                        self.activityIdenCollection.isHidden = true
                    }
                    
                    self.pageNumber += 1
                }
                
            })
            
        }
        
    }
}
