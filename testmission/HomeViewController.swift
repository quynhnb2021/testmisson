//
//  HomeViewController.swift
//  testmission
//
//  Created by Bao on 17/01/2022.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    private var collectionView: UICollectionView?
    private var imageView: UIImageView?
    private var isTap = false
    
    var cards = [Card(nameCard: "c01", status: false),
                 Card(nameCard: "c02", status: false),
                 Card(nameCard: "c03", status: false),
                 Card(nameCard: "c04", status: false),
                 Card(nameCard: "c05", status: false),
                 Card(nameCard: "c06", status: false),
                 Card(nameCard: "c07", status: false),
                 Card(nameCard: "c08", status: false),
                 Card(nameCard: "c09", status: false),
                 Card(nameCard: "c10", status: false),
                 Card(nameCard: "c11", status: false),
                 Card(nameCard: "c12", status: false),
                 Card(nameCard: "c13", status: false),
                 Card(nameCard: "c14", status: false),
                 Card(nameCard: "m00", status: false),
                 Card(nameCard: "m01", status: false),
                 Card(nameCard: "m02", status: false),
                 Card(nameCard: "m03", status: false),
                 Card(nameCard: "m04", status: false),
                 Card(nameCard: "m05", status: false),
                 Card(nameCard: "m06", status: false),
                 Card(nameCard: "m07", status: false),
                 Card(nameCard: "m08", status: false),
                 Card(nameCard: "m09", status: false),
                 Card(nameCard: "m10", status: false),
                 Card(nameCard: "m11", status: false),
                 Card(nameCard: "m12", status: false),
                 Card(nameCard: "m13", status: false),
                 Card(nameCard: "m14", status: false),
                 Card(nameCard: "m15", status: false),
                 Card(nameCard: "m16", status: false),
                 Card(nameCard: "m17", status: false),
                 Card(nameCard: "m18", status: false),
                 Card(nameCard: "m19", status: false),
                 Card(nameCard: "m20", status: false),
                 Card(nameCard: "m21", status: false),
                 Card(nameCard: "p01", status: false),
                 Card(nameCard: "p02", status: false),
                 Card(nameCard: "p03", status: false),
                 Card(nameCard: "p04", status: false),
                 Card(nameCard: "p05", status: false),
                 Card(nameCard: "p06", status: false),
                 Card(nameCard: "p07", status: false),
                 Card(nameCard: "p08", status: false),
                 Card(nameCard: "p09", status: false),
                 Card(nameCard: "p10", status: false),
                 Card(nameCard: "p11", status: false),
                 Card(nameCard: "p12", status: false),
                 Card(nameCard: "p13", status: false),
                 Card(nameCard: "p14", status: false),
                 Card(nameCard: "s01", status: false),
                 Card(nameCard: "s02", status: false),
                 Card(nameCard: "s03", status: false),
                 Card(nameCard: "s04", status: false),
                 Card(nameCard: "s05", status: false),
                 Card(nameCard: "s06", status: false),
                 Card(nameCard: "s07", status: false),
                 Card(nameCard: "s08", status: false),
                 Card(nameCard: "s09", status: false),
                 Card(nameCard: "s10", status: false),
                 Card(nameCard: "s11", status: false),
                 Card(nameCard: "s12", status: false),
                 Card(nameCard: "s13", status: false),
                 Card(nameCard: "s14", status: false),
                 Card(nameCard: "w01", status: false),
                 Card(nameCard: "w02", status: false),
                 Card(nameCard: "w03", status: false),
                 Card(nameCard: "w04", status: false),
                 Card(nameCard: "w05", status: false),
                 Card(nameCard: "w06", status: false),
                 Card(nameCard: "w07", status: false),
                 Card(nameCard: "w08", status: false),
                 Card(nameCard: "w09", status: false),
                 Card(nameCard: "w10", status: false),
                 Card(nameCard: "w11", status: false),
                 Card(nameCard: "w12", status: false),
                 Card(nameCard: "w13", status: false),
                 Card(nameCard: "w14", status: false),]
    
//    var cardss: [String] = ["c01", "c02", "c03","c04", "c05", "c06","c07", "c08", "c09","c10", "c11", "c12","c13", "c14", "m00","m01", "m02", "m03","m04","m05", "m06", "m07","m08","m09", "m10", "m11","m12","m13", "m14", "m15","m16","m17", "m18", "m19", "m20","m21", "p01", "p02", "p03","p04", "p05", "p06","p07", "p08", "p09","p10", "p11", "p12","p13", "p14","s01", "s02", "s03","s04", "s05", "s06","s07", "s08", "s09","s10", "s11", "s12","s13", "s14","w01", "w02", "w03","w04", "w05", "w06","w07", "w08", "w09","w10", "w11", "w12","w13", "w14"]
//
    override func viewDidLoad() {
        super.viewDidLoad()
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: view.frame.size.width/3.2, height:  view.frame.size.width/3.2)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.backgroundColor = .white
        view.addSubview(collectionView!)
        let gesture = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPressGesture(_:)))
        // Do any additional setup after loading the view.
        collectionView?.addGestureRecognizer(gesture)
    }
    
    @objc func handleLongPressGesture(_ gesture: UILongPressGestureRecognizer) {
        guard let collectionView = collectionView else { return  }
        switch gesture.state {
        case .began:
            guard let targetIndexPath = collectionView.indexPathForItem(at: gesture.location(in: collectionView)) else { return }
            collectionView.beginInteractiveMovementForItem(at: targetIndexPath)
        case .changed:
            collectionView.updateInteractiveMovementTargetPosition(gesture.location(in: collectionView))
        case .ended:
            collectionView.endInteractiveMovement()
        default:
            collectionView.cancelInteractiveMovement()
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView?.frame = view.bounds
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        isTap = !isTap
        cards[indexPath.row].status = isTap
//        data.status = true
//        cards.remove(at: indexPath.row)
//        cards.append(data)
        
        collectionView.reloadData()
//        print(indexPath)
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
//        imageView = UIImageView(image: UIImage(named: cards[indexPath.row]))
//
//        cell.contentView.addSubview(imageView!)
//        collectionView.reloadData()
//        collectionView.reloadItems(at: [indexPath])
//            collectionView.reloadSections(sections:)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        let data = cards[indexPath.row]
        if(data.status == false ) {
            imageView = UIImageView(image: UIImage(named: "back"))
        } else {
            imageView = UIImageView(image: UIImage(named: data.nameCard ?? "c01" ))
        }
       
        imageView?.frame.size = CGSize(width: view.frame.size.width/3.2, height:  view.frame.size.width/3.2)
            cell.contentView.addSubview(imageView!)

        return cell
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.size.width/3.2, height:  view.frame.size.width/3.2)
    }
    
    func collectionView(_ collectionView: UICollectionView, canMoveItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let item = cards.remove(at: sourceIndexPath.row)
        cards.insert(item, at: destinationIndexPath.row)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
           return UIEdgeInsets(top: 8, left: 5, bottom: 8, right: 5)
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
